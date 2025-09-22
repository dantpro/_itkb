DB
--- 

_msf db init:_  
>
> sudo systemctl enable postgresql  
> sudo systemctl start postgresql  
> sudo msfdb init  
> msfconsole -q  
> `msf > db_status`

_upd msf pg collation:_  
>
> sudo -u postgres psql  
>
> `# \l`  
> `# \c msf`  
> `# REINDEX DATABASE msf;`  
> `# ALTER DATABASE msf REFRESH COLLATION VERSION;`  
> `# \q`  



  



