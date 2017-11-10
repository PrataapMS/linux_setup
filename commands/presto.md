# Presto Commands

 - __Download presto-cli-0.188-executable.jar, rename it to presto, make it executable with chmod +x, then run it:__

```bash
 ./presto --server localhost:8080 --catalog mysql --schema default
```
  - __Notes:__
	- *'--mysql' can be replaced with the data source like --hive*
	- *Run --help to get help parameters*
---

### Querying MySQL

 - The MySQL connector provides a schema for every MySQL database. You can see the available MySQL databases by running SHOW SCHEMAS:
```bash
SHOW SCHEMAS FROM mysql;
```
 
 - If you have a MySQL database named foodmart, you can view the tables in this database by running SHOW TABLES:
```bash
SHOW TABLES FROM mysql.foodmart;
```
 
 - You can see a list of the columns in the employee table in the foodmart database using either of the following:
```bash
DESCRIBE mysql.foodmart.employee;

SHOW COLUMNS FROM mysql.foodmart.employee;
```
 
 - Finally, you can access the clicks table in the web database:
```bash
SELECT * FROM mysql.web.clicks;
```

If you used a different name for your catalog properties file, use that catalog name instead of mysql in the above examples.