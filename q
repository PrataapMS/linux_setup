[1mdiff --git a/django-rest-dynamodb-setup.md b/django-rest-dynamodb-setup.md[m
[1mindex 5998355..b3f1925 100644[m
[1m--- a/django-rest-dynamodb-setup.md[m
[1m+++ b/django-rest-dynamodb-setup.md[m
[36m@@ -63,9 +63,9 @@[m [mFollow this link to find the latest document of required, else follow as below[m
 $ java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb[m
 ```[m
 [m
[31m-+ I use this command[m
[32m+[m[32m+ I use this command, so that the port does not conflict with my django server or any others.[m
 ```bash[m
[31m-$ java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb -inMemory -port 8008[m
[32m+[m[32m$ java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb -inMemory -port 8009[m
 ```[m
 ###### Important[m
 > DynamoDB on your computer requires the Java Runtime Environment (JRE) version 6.x or newer; it will not run on older JRE versions.[m
[36m@@ -170,4 +170,6 @@[m [mUserModel.create_table(read_capacity_units=1, write_capacity_units=1)[m
 [m
 ```python[m
 user = UserModel('test@example.com', first_name='Samuel', last_name='Adams')[m
[31m-```[m
\ No newline at end of file[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32m> Follow this indepth tutorial on PynamoDB: <http://pynamodb.readthedocs.io/en/latest/tutorial.html>[m
