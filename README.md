# airflow-rpm

Tested on CentOS 7

## Install Build Requirements
```
$> sudo yum install epel-release
$> sudo yum update
$> sudo yum install rpm-build python2-pip python-devel mariadb-devel libffi-devel cyrus-sasl-devel gcc-c++
$> sudo pip install setuptools --upgrade
$> sudo pip install pip --upgrade
```

## Clone 
```
$> git clone https://github.com/hurdad/airflow-rpm.git
$> cd airflow-rpm
```

## Configure Version + Packages
Configure Airflow version on pip
```
$> cat Makefile
...
version = 1.7.1.3
```

## Configure Airflow Packages
```
$> cat Makefile
...
packages = devel,devel_hadoop,celery,crypto,jdbc,hdfs,kerberos,ldap,mysql,password,postgres,rabbitmq
```

## Build RPM
```
$> make
```

## Get RPMS
```
$> ls -al rpmbuild/RPMS/x86_64/
```


