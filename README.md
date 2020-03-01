# mysqlbackup
Backup mySQL database into separate objects for manageable object maintenance

The batch product allows easier mySQL database management. The batch uses mysql to execute SQL queries and extract objects from database. 

# Here is usage: 
The backup process orks in 2 phases:
 1. Create list of database object
 2. Backup objects from updated list

# Steps to execute:
 1. Execute **updateObjects.bat** to update list of DB objects. 
 2. Execute **backupDB.bat** to create backup.

# usage warning
Please be carefull while using using the batch and test backups generated before making them your regular backup utility.

# Suggestions/queries
Please email me at mrdeepakvarna@gmail.com
