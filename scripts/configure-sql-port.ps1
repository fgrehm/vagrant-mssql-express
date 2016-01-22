# http://stackoverflow.com/a/9949105
$ErrorActionPreference = "Stop"

echo "Configuring TCP port"

# http://technet.microsoft.com/en-us/library/dd206997(v=sql.105).aspx
# Load assemblies
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

echo "DONE!"

echo "Restarting service..."
# Restart service so that configurations are applied
restart-service -f "SQL Server (SQLEXPRESS)"
echo "DONE!"
