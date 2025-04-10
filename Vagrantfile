Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/jammy64"
  
    config.vm.define "cobol-lab" do |vm|
      vm.vm.hostname = "jean"
      vm.vm.network "private_network", type: "dhcp"
      vm.vm.synced_folder ".", "/home/vagrant/workspace", type: "virtualbox"
      vm.vm.provider "virtualbox" do |vb|
        vb.name = "lab-cobol-hercules"
        vb.memory = 2048
        vb.cpus = 2
      end
  
      vm.vm.provision "shell", path: "setup_project.sh"
      vm.vm.provision "shell", path: "check_version.sh"
    end
  end  