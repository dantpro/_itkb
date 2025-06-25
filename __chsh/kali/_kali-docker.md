https://purpleschool.ru/knowledge-base/article/kali  
https://thenewstack.io/penetration-testing-with-kali-linux-as-a-docker-container  
https://www.kali.org/docs/containers/using-kali-docker-images  
https://www.kali.org/docs/containers/official-kalilinux-docker-images  

> #docker-ce  
> https://www.kali.org/docs/containers/installing-docker-on-kali  
>
> `echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list`         
>
> `curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`    
> sudo apt update  
> sudo apt install docker-ce docker-ce-cli containerd.io  

> #docker.io  
> sudo apt install -y docker.io   
> sudo apt install -y docker-compose  

> #docker-compose  
> `version=$(wget -qO- https://api.github.com/repos/docker/compose/releases/latest | grep -v "central-infosec" | grep ".tag_name" | cut -d'"' -f4)`    
> `sudo wget -q -O /usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/$version/docker-compose-$(uname -s)-$(uname -m)#cis"`    
> sudo chmod +x /usr/local/bin/docker-compose  
  
> docker pull kalilinux/kali-rolling  
> docker run -it kalilinux/kali-rolling  
> $apt install kali-linux-core  
> $apt install iproute2  mtr-tiny mc htop inetutils-ping net-tools  
> 
> docker ps  
> docker ps -a      
> docker container list  
> docker container list --all  
> docker commit id kalicore  
> docker rm id  
> docker images  
> docker image ls  
> docker image rm id    
> docker run -it kalicore  
> docker start -ai id
> docker start id  
> docker attach id  

