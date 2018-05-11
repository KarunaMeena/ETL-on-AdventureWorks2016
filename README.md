# ETL-on-AdventureWorks2016

# Problem Statement 

Extracting data from Source database and loading to target database

-	Source database: 

AdventureWorks2016_us - sql server - backup AdventureWorks2016_us.bak
AdventureWorks2016_eu - mysql  
AdventureWorks2016_au - postgresql  
AdventureWorks2016_ca - oracle 
Source files-
-	Target database: 

AdventureWorksDW_neu: SQL Server for SSIS Target

# Instructions on how to open the project

- Load all the source files into the databases
- Install ODBC driver for MySQL, PostgreSQL and Oracle (For SQL Server, you can use the OLE DB Source and Destination)
- Connect the source files using the ODBC Data sources
- Load the source data files to all the inputand output data components
- Change the path to of all the flat files


# Source Files

<img width="540" alt="sources" src="https://user-images.githubusercontent.com/32627251/39931072-5ba9c154-550a-11e8-844a-6aff9e40490c.PNG">

# Target Tables

<img width="356" alt="target" src="https://user-images.githubusercontent.com/32627251/39931967-def6cfe6-550c-11e8-8611-e5482e881b1a.PNG">

# Master Job to load the data warehouse at one click
<img width="895" alt="masterjob" src="https://user-images.githubusercontent.com/32627251/39933803-f3793d8c-5511-11e8-91b5-ccdccb85d88d.PNG">

# Snapshots of few SSIS jobs

- DimEmployee
<img width="582" alt="dimemployee" src="https://user-images.githubusercontent.com/32627251/39934880-426fa34c-5515-11e8-9ae2-606cc9a6f154.PNG">

