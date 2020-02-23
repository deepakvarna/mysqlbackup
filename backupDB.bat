 rem indos batch file to back up all DB object

@echo off
setlocal EnableDelayedExpansion
Set path=%path%;c:\Program Files\MySQL\MySQL Server 5.7\bin
Set /P Server="Please enter server IP and Port: "

Set /P UserName="Please enter user name to connect: "

Set /P Database="Please enter Database to backup: "

Set /P Object="Please select Objects to Backup: 1. For Procedures 2. For Functions : "

Set /P pass="Enter Pass"

FOR /F %%i IN (./ObjectList/Functions.txt) DO mysql -h localhost -D %Database% -u pquser -p%pass% -e "Select concat('Create ', type,' ', name, '
',body) as '-- Routine' from mysql.proc where name='%%i'" >> ./Functions/%%i.sql

pause