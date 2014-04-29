# Docker Hiawatha #

A [Docker][docker] image which provides the lightweigth and secure [Hiawatha][hiawatha] webserver.

## Prerequisites ##

Docker builds upon [Linux Containers][lxc] (LXC) and thus, only runs on Linux. In order to allow you to also play with Docker on non-Linux machines, there are two ways to run this demo, i.e., inside a [Vagrant Box][vagrant] or directly on Linux. Please see the respective subsections below. For both cases you need to install `make`.

### Vagrant Box ###

If you decide to run the demo inside a Vagrant box, please install Vagrant accordingly. The supplied Vagrantfile requires Vagrant version 1.4.0 or higher, because starting from that version Docker can be automatically installed. As provider, VirtualBox is assumed. Once Vagrant is installed, just run
> `vagrant up; vagrant ssh`   
> `cd /vagrant`

in the root directory. Then follow the same instructions as for native Linux.

### Native Linux  ###

If you decide to run the demo on a native Linux, please install Docker according to your distribution. There are How-Tos for many different distributions in the Docker [documentation][docker-install-doc].

## Running the Demo ##

### 1. Build Images ###

In the first step, the Docker image, starting from an Debian wheezy base image, is build. 
> `make build`

### 2. Starting containers ###

In the second step, a LXC container is started
> `make start`

### 3. Access the website ###

You can access [Hiawatha][hiawatha] via http://localhost an the PHP-Info via http://tester (first you have add `tester` to the 127.0.0.1 @ /etc/hosts) in your Browser.

#### Show Running Containers ####

If you want to see the running container, run
> `docker ps`  

### 4. Stopping containers ###

In order to stop all running containers, run 
> `make stop`

and to clean up run
> `make clean`

[docker]: http://docker.io
[lxc]: http://linuxcontainers.org/
[vagrant]: http://www.vagrantup.com
[docker-install-doc]: http://docs.docker.io/en/latest/installation/
[hiawatha]: https://www.hiawatha-webserver.org/

