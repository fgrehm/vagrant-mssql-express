# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

if ! File.exists?('./SQLEXPRWT_x64_ENU.exe')
  puts 'SQL Server installer could not be found!'
  puts "Please run:\n  wget http://download.microsoft.com/download/0/4/B/04BE03CD-EAF3-4797-9D8D-2E08E316C998/SQLEXPRWT_x64_ENU.exe"
  exit 1
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "opentable/win-2008r2-standard-amd64-nocm"
  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.network :forwarded_port, guest: 3389, host: 3389

  config.vm.provision :shell, path: "scripts/install-dot-net.ps1"
  config.vm.provision :shell, path: "scripts/install-sql-server.cmd"
  config.vm.provision :shell, path: "scripts/configure-sql-port.ps1"
  config.vm.provision :shell, path: "scripts/enable-rdp.ps1"
end
