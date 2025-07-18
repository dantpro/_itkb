https://computingforgeeks.com/install-docker-and-docker-compose-on-kali-linux/  
https://computingforgeeks.com/how-to-install-latest-docker-compose-on-linux/  
https://computingforgeeks.com/managing-docker-containers-with-docker-compose/  

> sudo apt update  
> sudo apt full-upgrade  

> sudo apt install curl gnupg2 apt-transport-https software-properties-common ca-certificates  
> [ -f /var/run/reboot-required ] && sudo reboot -f  

#docker-ce    

> `curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`  
> `echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list`

> sudo apt install docker-ce docker-ce-cli containerd.io  

> sudo usermod -aG docker $USER  
> #newgrp docker  

> docker version  
> docker run --rm -it  hello-world  

#compose  
>  
> `curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -`  
> chmod +x docker-compose-linux-x86_64  
> sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose  

> docker-compose version  

> vim docker-compose.yml  

```
version: '3'
services:
  web:
    image: nginx:latest
    ports:
     - "8080:80"
    links:
     - php
  php:
    image: php:8-fpm
```

> docker-compose up -d  
> docker-compose ps  
> docker-compose ps -a  
> docker-compose stop  
> docker-compose rm -f  

