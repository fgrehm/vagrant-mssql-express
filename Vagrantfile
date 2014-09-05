# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

$enable_gui = ENV['GUI'] || ENV['gui']

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "opentable/win-2008r2-standard-amd64-nocm"
  config.vm.network "private_network", ip: "192.168.50.4"

  config.vm.provider :virtualbox do |vb|
    vb.gui = $enable_gui == '1'
  end

  # Download from http://www.microsoft.com/en-us/download/details.aspx?id=30438
  # Place the file at XXXXX
  # http://msdn.microsoft.com/en-us/library/ms144259%28v=SQL.100%29.aspx
  # http://technet.microsoft.com/en-us/library/ee176858.aspx
  # http://iqbalnaved.wordpress.com/2013/09/28/configuration-for-connecting-to-mssql-server-2008-on-virtualbox-guestos-from-ubuntu-12-04-hostos-using-pyodbc-3-0-8/
  # http://technet.microsoft.com/en-us/library/dd206997(v=sql.105).aspx
  # http://sirsql.net/blog/2011/6/21/set-the-sql-tcpip-port-with-powershell.html

  config.vm.provision :shell, path: "provision.ps1"
  config.vm.provision :shell, path: "install-sql-server.cmd"
  config.vm.provision :shell, path: "configure-sql-port.ps1"
end

# sudo apt-get install freetds-* sqsh
# test connection with telnet IP 1433
