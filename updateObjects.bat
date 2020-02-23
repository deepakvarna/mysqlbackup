 rem indos batch file to back up all DB object

@echo off
Set path=%path%;c:\Program Files\MySQL\MySQL Server 5.7\bin
Set /P Server="Please enter server IP and Port: "

Set /P UserName="Please enter user name to connect: "

Set /P Database="Please enter Database to backup: "

Set /P Object="Please select Objects to Backup: 1. For Procedures 2. For Functions : "

mysql -h %Server% -u %UserName% -p  -e "Select name from mysql.proc where type= 'FUNCTION' AND db='%Database%' " >> ./ObjectList/Functions.txt
mysql -h %Server% -u %UserName% -p  -e "Select name from mysql.proc where type= 'PROCEDURE' AND db='%Database%' " >> ./ObjectList/Routines.txt


pause