# About

Demonstration of capabilities of Data Science Notebooks.

# Quick Start

### Option 1: Run in virtual machine

The notebooks can be easily started via a pre-configured VirtualBox image (requires > 5GB).

1.  Install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/) (optionally on Windows: install GitShell or similar)
2.  Open a command line tool in the base directory (containing `Vagrantfile`) and run `vagrant up`. Setting up the virtual machine may take a while as images for the VM and docker are downloaded.
3.  Access [http://localhost:8888](http://localhost:8888) in your web browser

### Option 2: Run in docker container

1.  Install [docker](https://www.docker.com/)
2.  Create & start container:

        sudo docker run -d -p 8888:8888 --name jupyter -v $(pwd):/home/jovyan/work jupyter/all-spark-notebook
3.  Update R libraries:

        sudo docker exec -u root jupyter R -e "install.packages(c('data.table', 'dplyr', 'gridExtra', 'corrplot'), repos='http://cran.fhcrc.org')"
4.  Access [http://localhost:8888](http://localhost:8888) in your web browser
 
To start and stop container: ```sudo docker start jupyter``` and ```sudo docker stop jupyter```
