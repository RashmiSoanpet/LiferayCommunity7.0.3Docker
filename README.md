Docker Liferay Community Edition Portal 7.0.3 GA4
========================================


Description:
--------------------------------
Development Liferay Community Edition Portal 7.0.3 GA4 environment with Docker.


Developed & Test on:
--------------------------------
Docker Client Version: 18.06.1-ce

Docker Server Version: 18.06.1-ce

OS: Ubuntu 18.04.1 LTS


Docker Infrastructure
--------------------------------
Images:

New_Images                 | Based On
---------------------------|---------
mysql_liferay:1.0          | mysql:5.7
liferaycommunity7.0.3:1.0  | centos:7.5


Nets:

NETWORK ID     |     NAME           |     DRIVER       |       SCOPE
---------------|--------------------|------------------|-------------
27d159518a6b   |     bridge         |     bridge       |       local
6c3707ce1234   |     host           |     host         |       local
64975df8e12d   |     liferay-net    |     bridge       |       local

Volumes:

DRIVER     |   VOLUME NAME
-----------|---------------
local      |   data_volumen
local      |   mysql_volumen
local      |   osgi_volumen



Usage
------------------------

1) Clone the project:
```
$ git clone https://github.com/felix-centenera/LiferayCommunity7.0.3Docker.git
$ cd LiferayCommunity7.0.3Docker
```

2) Build the images:

Build Mysql database image with the user, database, and privileges required:
```
$ cd dbmysql
$ docker build -t mysql_liferay:1.0 .
```

Build Liferay image
```
$ cd appliferay
$ docker build -t liferaycommunity7.0.3:1.0 .
```

3) Create a docker network:
```
$ docker network create liferay-net
```


4) Run the images (It will create different volumes required to keep safe our data.):
```
$ docker run -t -d --net liferay-net --name mysql_dev -e MYSQL_ROOT_PASSWORD=test -v mysql_volumen:/var/lib/mysql --publish 0.0.0.0:3306:3306 mysql_liferay:1.0

$ docker run -it -d --net liferay-net --name liferay_dev -v data_volumen:/opt/liferay-portal/data -v osgi_volumen:/opt/liferay-ce-portal-7.0-ga4/osgi --publish 0.0.0.0:8080:8080  liferaycommunity7.0.3:1.

```

5) Follow the logs of Liferay to check that it start properly, you will see the next trace "INFO [main] org.apache.catalina.startup.Catalina.start Server startup in 151102 ms":
```
$ docker logs --follow <Container_ID>
```

6) Access to Liferay WebConsole

url: http://localhost:8080/

user: test@liferay.com

password: test

7) You can deploy a Theme. Example:
```
docker cp Mercury\ Theme.lpkg <Container_ID>:/opt/liferay-portal/deploy
```
