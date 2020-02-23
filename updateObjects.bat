 rem indos batch file to back up all DB object

@echo off
Set path=%path%;c:\Program Files\MySQL\MySQL Server 5.7\bin
Set /P Server="Please enter server IP and Port: "

Set /P UserName="Please enter user name to connect: "

Set /P Database="Please enter Database to backup: "

REM echo "Please select Objects to Backup: "
REM echo "1. For Procedures"
REM echo "2. For Functions" 

@echo off
setlocal

set /P "=_" < NUL > "Enter password"
findstr /A:1E /V "^$" "Enter password" NUL > CON
del "Enter password"
set /P "password="
cls
color 07
mysql -N -h %Server% -u %UserName% -p%password%  -e "Select name from mysql.proc where type= 'FUNCTION' AND db='%Database%' " >> ./ObjectList/Functions.txt
mysql -N -h %Server% -u %UserName% -p%password%  -e "Select name from mysql.proc where type= 'PROCEDURE' AND db='%Database%' " >> ./ObjectList/Routines.txt


pause