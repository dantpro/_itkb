https://www.centralinfosec.com/blog/bloodhound-kali-install  
https://breachar.medium.com/install-bloodhound-ce-under-kali-linux-2024-4-2a68feebdb62  
https://hacker4u.medium.com/bloodhound-community-edition-bhce-e35bf49fcfe6  

> `sudo apt install -y docker.io`  
> `sudo apt install -y docker-compose`  

> `# version=$(wget -qO- https://api.github.com/repos/docker/compose/releases/latest | grep -v "central-infosec" | grep ".tag_name" | cut -d'"' -f4)`    
> `# sudo wget -q -O /usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/$version/docker-compose-$(uname -s)-$(uname -m)#cis"`      
> `# sudo chmod +x /usr/local/bin/docker-compose`    

> `mkdir ~/___/app/bhce`    
> `cd ~/___/app/bhce`  

> `wget -q -O ./docker-compose.yml https://ghst.ly/getbhce`
> `echo 'BLOODHOUND_HOST=0.0.0.0' > ./bhce.env`   

> `sudo docker-compose --env-file ./bhce.env -f ./docker-compose.yml up`  
> Container bhce-bloodhound-1  Created      
> `sudo docker logs bhce-bloodhound-1 2>&1 | grep "Initial Password Set To:"`  

http://localhost:8080/ui/login

> `sudo apt install -y pipx`  

> `mkdir ~/___/app/bhpy`    
> `cd ~/___/app/bhpy`    

> `python -m venv .venv`  
> `source ./.venv/bin/activate`    
> `pip install bloodhound`    
> `pip install bloodhound-ce`    

> `mkdir bhdata && cd bhdata`    

`sudo bloodhound-python -d <domain> -u <user> -p <password> -ns <dc_ip> -c all`  
`sudo bloodhound-ce-python -d <domain> -u <user> -p <password> -ns <dc_ip> -c all`  
`sudo bloodhound-ce-python -d <domain> -u <user> -p <password> -ns <dc_ip> -c dconly`  
`sudo bloodhound-ce-python -d <domain> -u <user> -p <password> -ns <dc_ip> -c dconly -dc <dc_full_hostname> -gc <dc_full_hostname> -disable-autogc --zip -v`  

> `deactivate`  

