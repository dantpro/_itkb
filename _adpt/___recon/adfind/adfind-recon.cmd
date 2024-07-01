::https://thedfirreport.com/2020/05/08/adfind-recon/

adfind -f  "(objectcategory=person)" > ad_users.txt
adfind -f  "objectcategory=computer" > ad_computers.txt
adfind -sc  trustdmp > trustdmp.txt
adfind -subnets -f  (objectcategory=subnet) > subnets.txt
adfind -gcb -sc  trustdmp > trustdmp2.txt
adfind -sc  domainlist > domainlist.txt
adfind -sc  dcmodes > dcmodes.txt
adfind -sc  adinfo > adinfo.txt
adfind -sc  dclist > dclist.txt
adfind -sc  computers_pwdnotreqd > computers_pwdnotreqd.txt





