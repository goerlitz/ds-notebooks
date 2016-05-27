# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

# install script for additional R packages and PDF export
$installExtras = <<SCRIPT
#apt-get update && apt-get install -y inkscape
docker exec -u root jupyter R -e "install.packages(c('data.table', 'dplyr', 'gridExtra', 'corrplot'), repos='http://cran.fhcrc.org')"
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Official Ubuntu Server 14.04 LTS (Trusty Tahr) build
  config.vm.box = "ubuntu/trusty64"

  # define forwarded ports
  config.vm.network "forwarded_port", guest: 8888,  host: 8888    # jupyter
  config.vm.network "forwarded_port", guest: 54321, host: 54321   # H2O

  # set VM configuration
  config.vm.provider "virtualbox" do |vb|
    vb.name = "DS notebooks"
    vb.memory = 6144
    vb.cpus = 2
  end

  # build and run docker containers
  config.vm.provision "docker" do |docker|

    docker.pull_images "jupyter/all-spark-notebook"

    # start container for jupyter
    # mounting: current dir -> /vagrant -> /home/jovyan/work
    docker.run "jupyter/all-spark-notebook",
      args: "-d -p 8888:8888 --name jupyter -v /vagrant:/home/jovyan/work"

  end

  # install missing R packages in running jupyter container
  config.vm.provision "shell", inline: $installExtras

end

