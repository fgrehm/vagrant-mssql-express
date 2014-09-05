# http://stackoverflow.com/a/9949105
$ErrorActionPreference = "Stop"

import-module servermanager
echo "Installing .NET Framework"
add-windowsfeature as-net-framework

# Set TIMEZONE

# Remove left-over SQL 2008 entry from the start menu
# rmdir “C:ProgramDataMicrosoftWindowsStart MenuProgramsMicrosoft SQL Server 2008″ /q /s

# exit /B
# :ErrorEcho Script requires DBAdmin argument in the form domainGroup

# C:\vagrant\SQLEXPRWT_x64_ENU.exe /Q /Action=install /INDICATEPROGRESS /IAcceptSQLServerLicenseTerms /FEATURES=SQL,Tools /TCPENABLED=1 /SECURITYMODE="SQL" /SAPWD="sa"
