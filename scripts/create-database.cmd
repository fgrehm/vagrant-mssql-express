cmd /C ""C:\Program Files\Microsoft SQL Server\100\Tools\Binn\SQLCMD.EXE" -Q "create login dbadmin with password = '1HatePa$$wordRules' " "
cmd /C ""C:\Program Files\Microsoft SQL Server\100\Tools\Binn\SQLCMD.EXE" -Q "create database app_database" "
cmd /C ""C:\Program Files\Microsoft SQL Server\100\Tools\Binn\SQLCMD.EXE" -Q "alter authorization on database::app_database to dbadmin" "