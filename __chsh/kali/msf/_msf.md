DB
--- 

> sudo systemctl enable postgresql  
> sudo systemctl start postgresql  
> sudo msfdb init  
> msfconsole -q  
> `msf > db_status`

`pg collation`  
>
> sudo -u postgres psql  
>
> `# \l`  
> `# \c msf`  
> `# REINDEX DATABASE msf;`  
> `# ALTER DATABASE msf REFRESH COLLATION VERSION;`  
> `# \q`  



  



