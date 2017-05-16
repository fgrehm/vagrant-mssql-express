# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.cache.scope = :box if Vagrant.has_plugin?('vagrant-cachier')
  config.vm.box = 'opentable/win-2012r2-standard-amd64-nocm'
  config.vm.network :private_network, ip: '192.168.50.4'
  config.vm.network :forwarded_port, guest: 3389, host: 3389

  config.vm.provision :shell, path: 'scripts/provision.ps1'

  config.vm.provider 'virtualbox' do |v|
    host = RbConfig::CONFIG['host_os']

    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
    elsif host =~ /linux/
      cpus = `nproc`.to_i
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
    else
      cpus = 4
      mem = 2048
    end

    v.destroy_unused_network_interfaces = true
    v.customize [
      'modifyvm', :id,
      '--memory', mem,
      '--cpus', cpus
    ]
  end
end
