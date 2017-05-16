# Stop on error (think bash set -e) http://stackoverflow.com/a/9949105
$ErrorActionPreference = "Stop"

##### .NET Framework is required

echo "Installing .NET Framework"
#Import-Module ServerManager
Add-WindowsFeature as-net-framework

##### Install Sql Server Express 2012

# Download the installer
if (-Not (Test-Path 'C:\vagrant\SQLEXPRWT_x64_ENU.exe')) {
    echo "SQLEXPRWT_x64_ENU.exe is not present, attempting to download..."
    Invoke-WebRequest -UseBasicParsing 'http://download.microsoft.com/download/8/D/D/8DD7BDBA-CEF7-4D8E-8C16-D9F69527F909/ENU/x64/SQLEXPRWT_x64_ENU.exe'
}

# Short circuit if the service already exists
$service = Get-Service -Name 'SQL Server (SQLEXPRESS)' -ErrorAction SilentlyContinue
if ($service.Length -gt 0) {
    echo 'Sql server express is already installed'
    exit 0
}

echo 'Installing SQL Server 2012 Express, it may take a while...'
cmd.exe /c 'C:\vagrant\scripts\install-sql-server.cmd'

echo 'Disabling firewall...'
netsh advfirewall set allprofiles state off

##### Configuring TCP Port

echo "Configuring TCP port"
Add-Type -Path 'C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.Smo.dll'
Add-Type -Path 'C:\Program Files (x86)\Microsoft SQL Server\110\SDK\Assemblies\Microsoft.SqlServer.SqlWmiManagement.dll'

# http://www.dbi-services.com/index.php/blog/entry/sql-server-2012-configuring-your-tcp-port-via-powershell
# Set the port
$smo = 'Microsoft.SqlServer.Management.Smo.'
$wmi = new-object ($smo + 'Wmi.ManagedComputer')
$uri = "ManagedComputer[@Name='" + (get-item env:computername).Value + "']/ ServerInstance[@Name='SQLEXPRESS']/ServerProtocol[@Name='Tcp']"
$Tcp = $wmi.GetSmoObject($uri)
$wmi.GetSmoObject($uri + "/IPAddress[@Name='IPAll']").IPAddressProperties[1].Value="1433"
$Tcp.alter()

echo 'Restarting service...'
# Restart service so that configurations are applied
restart-service -f "SQL Server (SQLEXPRESS)"
