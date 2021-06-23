# COE
Common Oracle Environment for Linux and Solaris

### Installation instructions for the Oracle Cloud Infrastructure
```
# Connect as oracle
sudo su - oracle

# Clone this repository
git clone https://github.com/ludovicocaldara/COE.git

# Enable the profile scripts
echo ". ~/COE/profile.sh" >> $HOME/.bash_profile

# Load the new profile
. ~/.bash_profile
```

### (optional) Installing git and rlwrap on Linux
```
#### IF USING RH6/OL6 (OL6 is the old VM provided as DBaaS in Oracle Cloud)
# install EPEL repo for rlwrap 
sudo yum install yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
# Enable the Public Yum repository for git install)
cd /etc/yum.repos.d
sudo wget http://yum.oracle.com/public-yum-ol6.repo

#### IF USING RH7/OL7
# for OL7, enable the [ol7_developer_EPEL] repo in /etc/yum.repos.d/public-yum-ol7.repo
# Compute instances in 7.6 are already OK, you might need to add it for DBaaS servers
# If missing, this should work:
cat > /etc/yum.repos.d/ol7.epel.repo <<EOF
[ol7_epel]
name=Oracle Linux $releasever Latest ($basearch)
baseurl=https://yum.oracle.com/repo/OracleLinux/OL7/developer_EPEL/\$basearch/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle
gpgcheck=1
enabled=1
EOF


sudo yum install -y rlwrap git

```
Depending on your VM version, you might encounter problems installing rlwrap. Please let me know if you find a one-command-fits all.

### (optional) Installing git and rlwrap on Oracle Solaris 11
```
#### install pkgutil
# pkgadd -d http://get.opencsw.org/now CSWpkgutil
#### update repository
# /opt/csw/bin/pkgutil -U
####  install rlwrap + dependencies
# /opt/csw/bin/pkgutil -y -i rlwrap

### utilities are installed to /opt/csw/bin. This path is added to PATH in variables.conf
```

## Some examples of the environment:
```
# [ oracle@ludodb01:/home/oracle/COE [21:28:15] [18.4.0.0.0 [DBMS EE] SID=CDB] 130 ] #
# u
DB_Unique_Name           DB_Name  ludodb01       Oracle_Home
------------------------ -------- -------------- --------------------------------------------------
CDB_fra1cw               CDB      CDB            /u01/app/oracle/product/18.0.0.0/dbhome_1

# [ oracle@ludodb01:/home/oracle/COE [21:28:18] [18.4.0.0.0 [DBMS EE] SID=CDB] 0 ] #
# sid CDB
DB_UNIQUE_NAME  = CDB_fra1cw
ORACLE_SID      = CDB
ROLE            = PRIMARY
VERSION         = 18.4.0.0.0
ORACLE_HOME     = /u01/app/oracle/product/18.0.0.0/dbhome_1
NLS_LANG        = AMERICAN_AMERICA.AL32UTF8

# [ oracle@ludodb01:/home/oracle/COE [21:28:22] [18.4.0.0.0 [DBMS EE] SID=CDB] 0 ] #
# lsoh

HOME                        LOCATION                                                VERSION      EDITION
--------------------------- ------------------------------------------------------- ------------ ---------
OraGrid180                  /u01/app/18.0.0.0/grid                                  18.4.0.0.0   GRID
OraDB18000_home1            /u01/app/oracle/product/18.0.0.0/dbhome_1               18.4.0.0.0   DBMS EE


# [ oracle@ludodb01:/home/oracle/COE [21:28:28] [18.4.0.0.0 [DBMS EE] SID=CDB] 0 ] #
# s_

SQL*Plus: Release 18.0.0.0.0 - Production on Mon Apr 15 21:28:41 2019
Version 18.4.0.0.0

Copyright (c) 1982, 2018, Oracle.  All rights reserved.


Connected to:
Oracle Database 18c Enterprise Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

SQL> exit
Disconnected from Oracle Database 18c Enterprise Edition Release 18.0.0.0.0 - Production
Version 18.4.0.0.0

# [ oracle@ludodb01:/home/oracle/COE [21:32:05] [18.4.0.0.0 [DBMS EE] SID=CDB] 0 ] #
# svcstat
DB_Unique_Name           Service_Name                   PDB                            ludodb01
------------------------ ------------------------------ ------------------------------ --------------
cdb_fra1cw               pdb_service_test               PDB1                           ONLINE

# [ oracle@ludodb01:/home/oracle/COE [21:32:18] [18.4.0.0.0 [DBMS EE] SID=CDB] 0 ] #
#
```
