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
