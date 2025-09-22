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



  



