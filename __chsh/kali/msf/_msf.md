DB
--- 

*msf db init:*  
>
> sudo systemctl enable postgresql  
> sudo systemctl start postgresql  
> sudo msfdb init  
> msfconsole -q  
> `msf > db_status`

`upd msf pg collation:`  
>
> sudo -u postgres psql  
>
> `# \l`  
> `# \c msf`  
> `# REINDEX DATABASE msf;`  
> `# ALTER DATABASE msf REFRESH COLLATION VERSION;`  
> `# \q`  



  



