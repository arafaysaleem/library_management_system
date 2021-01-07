# Library Management System - ORACLE SQL BACKEND
The backend code was created on **Oracle Apex**. You can not use any other backend for this project using these files as they are only suited for oracle sql. However, you can write your own REST API if you don't want to use the ORDS API.

## :scroll: Options

  To setup this backend for your own use you have the following options:
  * Apex Online
  * Apex Client
  * SQL Developer

## :open_file_folder: Folders

  The folder breakdown is as follows:
  * Schema folder: Contains the code for DDL script.
  * Table data: Contains the data for inserting into tables
  * ORDS REST API: Contains the REST API utility package. This package contains the API code.

## :wrench: Setup

### Apex(Online & Client)

1. Upload and run the DDL script to setup the tables, triggers, index, constraints and sequences.
2. Upload the table data files using the Data Workshop to fill the tables.
3. Enable ORDS And register it with your schema.
4. Import the ORDS package to get the code for the REST API.
5. You need to visit each table individually and enable REST API on them as well.
6. You can use authentication but you'll have to setup permissions for that.
7. Once everything is up and ready you'll have to check the URLs
* Since I used a different account and schema name the URL might change for your API. Therefore, you can just visit any table's API link and compare the base url with the one that is hard coded inside the app.

### SQL Developer
1. Upload and run the DDL script to setup the tables, triggers, index, constraints and sequences.
2. Upload the table data files using the Data Workshop to fill the tables.
3. For setting up and enabling ORDS refer to their [documentation](https://www.oracle.com/webfolder/technetwork/tutorials/obe/db/ords/r30/Install_Administer_ORDS/Install_Administer_ORDS.html "Setup ORDS")
