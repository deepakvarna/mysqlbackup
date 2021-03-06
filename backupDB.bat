 rem indos batch file to back up all DB object

@echo off
setlocal EnableDelayedExpansion
Set path=%path%;c:\Program Files\MySQL\MySQL Server 5.7\bin
Set /P Server="Please enter server IP and Port: "

Set /P UserName="Please enter user name to connect: "

Set /P Database="Please enter Database to backup: "

rem Set /P Object="Please select Objects to Backup: 1. For Procedures 2. For Functions : "

@echo off
setlocal

set /P "=_" < NUL > "Enter password"
findstr /A:1E /V "^$" "Enter password" NUL > CON
del "Enter password"
set /P "password="
cls
color 07
rem echo The password read is: "%password%"

FOR /F %%i IN (./ObjectList/Routines.txt) DO mysql -N -h localhost -D %Database% -u %UserName% -p%password% -e "Select concat('Create ', type,' ', name, ' ',body) as '-- Routine' from mysql.proc where name='%%i'" >> ./Routines/%%i.sql

FOR /F %%i IN (./ObjectList/Functions.txt) DO mysql -N -h localhost -D %Database% -u %UserName% -p%password% -e "Select concat('Create ', type,' ', name, ' ',body) as '-- Routine' from mysql.proc where name='%%i'" >> ./Functions/%%i.sql

pause