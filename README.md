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
version = 1.8.0
```

## Configure Airflow Packages as needed
```
$> cat Makefile
...
packages = devel,devel_hadoop,celery,crypto,jdbc,hdfs,kerberos,ldap,mysql,password,postgres,rabbitmq
```

## Build RPM
```
$> make
```

## Install RPM
```
$> sudo yum install rpmbuild/RPMS/x86_64/airflow-1.7.1.3-1.el7.centos.x86_64.rpm
```

## Airflow Init Server Configuration
```
$> sudo su airflow
$> AIRFLOW_HOME=/usr/share/airflow \
AIRFLOW_CONFIG=${AIRFLOW_HOME}/airflow.cfg \
airflow
$> cat /usr/share/airflow/airflow.cfg
```

## Airflow InitDB
```
$> AIRFLOW_HOME=/usr/share/airflow \
AIRFLOW_CONFIG=${AIRFLOW_HOME}/airflow.cfg \
airflow initdb
$> exit
```

## Airflow Services Start (as needed)
```
$> sudo systemctl start airflow-flower
$> sudo systemctl start airflow-kerberos
$> sudo systemctl start airflow-scheduler
$> sudo systemctl start airflow-webserver
$> sudo systemctl start airflow-worker
```

## Airflow Service Status
```
$> sudo systemctl status airflow-flower
$> sudo systemctl status airflow-kerberos
$> sudo systemctl status airflow-scheduler
$> sudo systemctl status airflow-webserver
$> sudo systemctl status airflow-worker
```

## Airflow Services Start On Boot (as needed)
```
$> sudo systemctl enable airflow-flower
$> sudo systemctl enable airflow-kerberos
$> sudo systemctl enable airflow-scheduler
$> sudo systemctl enable airflow-webserver
$> sudo systemctl enable airflow-worker
```


