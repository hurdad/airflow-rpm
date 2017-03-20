# Airflow
SHELL := /bin/bash 
version =  1.7.1.3
name = airflow
full_name = $(name)-$(version)
#packages = all
packages = devel,devel_hadoop,celery,crypto,jdbc,hdfs,kerberos,ldap,mysql,password,postgres,rabbitmq

all: rpm

clean:
	rm -rf rpmbuild

mkdir: clean
	mkdir -p rpmbuild
	mkdir -p rpmbuild/BUILD
	mkdir -p rpmbuild/BUILDROOT
	mkdir -p rpmbuild/RPMS
	mkdir -p rpmbuild/SOURCES
	mkdir -p rpmbuild/SRPMS

rpm:
	rpmbuild $(RPM_OPTS) \
	  --define "_topdir %(pwd)" \
	  --define "_builddir %{_topdir}/rpmbuild/BUILD" \
	  --define "_buildrootdir %{_topdir}/rpmbuild/BUILDROOT" \
	  --define "_rpmdir %{_topdir}/rpmbuild/RPMS" \
	  --define "_srcrpmdir %{_topdir}/rpmbuild/SRPMS" \
	  --define "_specdir %{_topdir}" \
	  --define "_sourcedir  %{_topdir}/rpmbuild/SOURCES" \
	  --define "VERSION $(version)" \
	  --define "PACKAGES $(packages)" \
	  -ba $(name).spec
