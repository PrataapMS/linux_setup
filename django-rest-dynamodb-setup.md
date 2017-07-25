# Guide to setup Django-Rest server and DynamoDB

## Django-Rest API setup

Let's take a look at a quick example of using REST framework to build a simple model-backed API for accessing users and groups.

Startup up a new project like so...
```bash
$ pip install django
$ pip install djangorestframework
$ django-admin.py startproject example .
$ ./manage.py migrate
$ ./manage.py createsuperuser
Username (leave blank to use 'prataap'): prataap
Email address: prataap@gmail.com
Password: django12345
```

Now edit the example/urls.py module in your project:
```python
from django.conf.urls import url, include
from django.contrib.auth.models import User
from rest_framework import serializers, viewsets, routers

# Serializers define the API representation.
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'is_staff')


# ViewSets define the view behavior.
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer


# Routers provide a way of automatically determining the URL conf.
router = routers.DefaultRouter()
router.register(r'users', UserViewSet)


# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]
```

---

## DynamoDB Setup

Follow this link to find the latest document of required, else follow as below
<http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html#DynamoDBLocal.DownloadingAndRunning>

+ Download DynamoDB for free using this link and extract
  <https://s3.ap-south-1.amazonaws.com/dynamodb-local-mumbai/dynamodb_local_latest.tar.gz>

+ Run the server using this command on terminal from the extracted directory 
```bash
$ java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb
```

+ I use this command, so that the port does not conflict with my django server or any others.
```bash
$ java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb -inMemory -port 8009
```
###### Important
> DynamoDB on your computer requires the Java Runtime Environment (JRE) version 6.x or newer; it will not run on older JRE versions.

##### Command Line Options

DynamoDB running on your computer accepts the following command line options:

+ -cors value — Enable CORS support (cross-origin resource sharing) for JavaScript. You must provide a comma-separated "allow" list of specific domains. The default setting for -cors is an asterisk (*), which allows public access.

+ -dbPath value — The directory where DynamoDB will write its database file. If you do not specify this option, the file will be written to the current directory. Note that you cannot specify both -dbPath and -inMemory at once.
+ -delayTransientStatuses — Causes DynamoDB to introduce delays for certain operations. DynamoDB can perform some tasks almost instantaneously, such as create/update/delete operations on tables and indexes; however, the actual DynamoDB service requires more time for these tasks. Setting this parameter helps DynamoDB simulate the behavior of the Amazon DynamoDB web service more closely. (Currently, this parameter introduces delays only for global secondary indexes that are in either CREATING or DELETING status.)
+ -help — Prints a usage summary and options.
+ -inMemory — DynamoDB; will run in memory, instead of using a database file. When you stop DynamoDB;, none of the data will be saved. Note that you cannot specify both -dbPath and -inMemory at once.
+ -optimizeDbBeforeStartup — Optimizes the underlying database tables before starting up DynamoDB on your computer. You must also specify -dbPath when you use this parameter.
+ -port value — The port number that DynamoDB will use to communicate with your application. If you do not specify this option, the default port is 8000.

---

###### Note
+ DynamoDB uses port 8000 by default. If port 8000 is unavailable, this command will throw an exception. You can use the -port option to specify a different port number. For a complete list of DynamoDB runtime options, including -port , type this command:
```bash
$ java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -help
```
+ -sharedDb — DynamoDB will use a single database file, instead of using separate files for each credential and region. If you specify -sharedDb, all DynamoDB clients will interact with the same set of tables regardless of their region and credential configuration.


##### AWS Command Line Interface
 - To check the tables in dynamodb
```bash
$ aws dynamodb list-tables --endpoint-url http://localhost:8000
```

##### Install AWS CLI using pip and configure settings
```bash
$ pip install --upgrade awscli
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: ENTER
```

##### Install BOTO3
```bash
$ pip install boto3
```

> Follow this for reference https://aws.amazon.com/sdk-for-python/

> Follow this to Setup and use DynamoDB from python 
> <http://docs.aws.amazon.com/amazondynamodb/latest/gettingstartedguide/GettingStarted.Python.html>


```python
import boto3

dynamodb = boto3.resource('dynamodb', region_name='us-west-2', endpoint_url="http://localhost:8000")
```

> Check developer documentation for DynamoDB here:
> <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/SampleData.CreateTables.html>

> Also check this for more documentation or tutorial for DynamoDB
> <http://boto.readthedocs.io/en/latest/dynamodb_tut.html>\

 
---

### PynamoDB Usage and setup

**Note:**
> For local setup add meta attribute host = "http://localhost:8009". That is the port you are running dynamodb on. Refer: <http://pynamodb.readthedocs.io/en/latest/local.html>


> Follow this for quicksetup from official documentation <http://pynamodb.readthedocs.io/en/latest/quickstart.html>

> Quickly setup and checkout example programs here
> 
```bash
$ pip install pynamodb
#### Getting the examples
$ git clone https://github.com/pynamodb/PynamoDB.git
#### Configuring the examples
####  Change the port mentioned in to model to what you are running the DynanoDB on
$ cd pynamodb/examples
#### Running an example
$ python model.py
```

- This is how the model for a table is created using PynamoDB library

```python
from pynamodb.models import Model
from pynamodb.attributes import UnicodeAttribute

class UserModel(Model):
    """
    A DynamoDB User
    """
    class Meta:
        table_name = 'dynamodb-user'
        region = 'us-west-1'
        host = "http://localhost:8009" # only for local setup
    email = UnicodeAttribute(hash_key=True)
    first_name = UnicodeAttribute()
    last_name = UnicodeAttribute()
```

- Create the table

```python
UserModel.create_table(read_capacity_units=1, write_capacity_units=1)
```

- Create a user

```python
user = UserModel('test@example.com', first_name='Samuel', last_name='Adams')
```

- Connect to the table created using this below (Given in [example](https://github.com/pynamodb/PynamoDB/tree/master/examples) )

```python
from pynamodb.connection import TableConnection
table = TableConnection('Thread', host='http://localhost:8000')
print(table.describe_table())
print(table.get_item('hash-key', 'range-key'))
table.put_item('hash-key', 'range-key', attributes={'forum_name': 'value'})
table.delete_item('hash-key', 'range-key')
```

> Follow this indepth tutorial on PynamoDB: <http://pynamodb.readthedocs.io/en/latest/tutorial.html>
