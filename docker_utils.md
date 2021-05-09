# Docker Utils
## Installing Docker
### Uninstall older versions
```sh
sudo apt-get remove docker docker-engine docker.io containerd runc
````
### Set up the repository
#### Update ```apt``` package index
```sh
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```
#### Add Docker’s official GPG key
```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
Verify if I have the key with the fingerprint ```9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88```
```sh
sudo apt-key fingerprint 0EBFCD88

pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]
```
### Update the ```apt``` package index and install the latest docker version
```sh
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```
### Check if docker is up and running
```sh
sudo docker run hello-world
```

### Install a docker image from dockerhub
First, you need to create a Dockerfile. For example, to install PHP, you need to add the following:
```Dockerfile
FROM php:7.2-apache
COPY src/ /var/www/html
EXPOSE 80
```
Then you build
```sh
docker build -t php_rana .
```

Then you run by mirroring port 80 (outside) to 80 (inside the docker), and mount path /home/ubuntu/ to /var/www/html
```sh
docker run -p 80:80 -v /home/ubuntu/:/var/www/html/ php_rana
```

## Running Docker
### Running in interactive mode (useful for ubuntu instances for example)
To run a docker instance in an interactive mode, add **-it** to the run command like the following:
```sh
docker run -it ubuntu /bin/bash
```
To exit the interactive instance, type ```exit``` which will terminate the ```/bin/bash``` command but the container is not removed.

## Saving and loading an image file
### Saving an image to a file locally
It is possible to save a running image to a file by redirecting the stdout to a file:
```sh
docker save ubuntu_risc_v > risc_v.tar
```
Or by using -o option:
```sh
docker save -o risc_v.tar ubuntu_risc_v
```
### Create an image from a running container
It is possible to create an image from a container using the ```commit``` command:
```sh
docker commit ubuntu_risc_v
```
### Tagging the image
If we run ```docker images```, the recently created image will have a tag ```<none>```. To add a tag to this image, run the following command:
```sh
docker tag IMAGE_ID risc_v_image
```
Please note that it is possible to both create and tag the image at the same time like the following:
```sh
docker comit ubuntu_risc_v risc_v_image
```
## Removing a container
To remove a container, use the following command
```sh
docker rm risc_v_image
```
### Loading a local image
To load a local image, list all available images then load the selected image (from stdin):
```sh
docker image ls
docker load < risc_v.tar
```
Or by using the -i option:
```sh
docker load -i risc_v.tar
```
---
## Some docker utils
### List all images:
```sh
docker images
```
### Inspect all containers (even the stopped ones)
```sh
docker ps -a
```



