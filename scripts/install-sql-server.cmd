:: /SAPWD = password.  Probably don't futz with the other parameters
:: For a full list: https://msdn.microsoft.com/en-us/library/ms144259(v=sql.110).aspx
C:\vagrant\SQLEXPRWT_x64_ENU.exe /Q /Action=install /INDICATEPROGRESS /INSTANCENAME="SQLEXPRESS" /INSTANCEID="SQLExpress" /IAcceptSQLServerLicenseTerms /FEATURES=SQL,Tools /TCPENABLED=1 /SECURITYMODE="SQL" /SAPWD="password1"
