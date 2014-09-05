@echo off

echo Installing SQL Server 2008 Express R2...
C:\vagrant\SQLEXPRWT_x64_ENU.exe /Q /Action=install /INDICATEPROGRESS /INSTANCENAME="SQLEXPRESS" /INSTANCEID="SQLExpress" /IAcceptSQLServerLicenseTerms /FEATURES=SQL,Tools /TCPENABLED=1 /SECURITYMODE="SQL" /SAPWD="#SAPassword!"
echo Done!

echo Disabling firewall
netsh advfirewall set allprofiles state off
echo DONE!

:: Configure Windows Server 2008/R2 auditing policy
::auditpol /set /subcategory:"application generated" /success:enable /failure:enable
