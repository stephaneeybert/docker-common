#!/bin/bash

# Have the data directory own by the machine hosting the container
chown -R $HOST_USER_ID /usr/local/mariadb/install/data
chgrp -R $HOST_GROUP_ID /usr/local/mariadb/install/data

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
source /usr/local/mariadb/expand-secrets.sh

# Check if the database server has not yet been fully installed
if [ ! -f /usr/local/mariadb/install/data/ibdata1 ]; then
  # Do the post installation
  chmod 744 /usr/local/mariadb/install/scripts/mysql_install_db
  # Needed to avoid running the next command before the previous file has been released by the permissions change
  sleep 1
  /usr/local/mariadb/install/scripts/mysql_install_db \
    --no-defaults \
    --explicit_defaults_for_timestamp \
    --basedir=/usr/local/mariadb/install \
    --datadir=/usr/local/mariadb/install/data \
    --tmpdir=/usr/local/mariadb/install/tmp \
    --lc-messages-dir=/usr/local/mariadb/install/share

  # Start the database server
  /usr/local/mariadb/install/bin/mysqld_safe --defaults-file=/usr/local/mariadb/install/my.cnf &
  sleep 10s

  # Configure the root user
  /usr/local/mariadb/install/bin/mysql -u root -v -e "grant all on *.* to root@'%' identified by '$DB_ROOT_PASSWORD' with grant option; flush privileges;"
  # The % does not include localhost so the same command has to be executed for specific hosts 
  /usr/local/mariadb/install/bin/mysql -u root -v -e "grant all on *.* to root@'mysql' identified by '$DB_ROOT_PASSWORD' with grant option; flush privileges;"
  /usr/local/mariadb/install/bin/mysql -u root -v -e "grant all on *.* to root@'localhost' identified by '$DB_ROOT_PASSWORD' with grant option; flush privileges;"

  # Avoid having to provide the user password on the command line
  # But only after having set the root password
  export MYSQL_PWD=$DB_ROOT_PASSWORD

  # Remove any existing default users
  /usr/local/mariadb/install/bin/mysql -u root -v -e "use mysql; delete from user where User = ''; flush privileges;"

  # tail -f /etc/hosts
else
  # Avoid having to provide the user password on the command line
  export MYSQL_PWD=$DB_ROOT_PASSWORD

  # Start the database server
  /usr/local/mariadb/install/bin/mysqld_safe --defaults-file=/usr/local/mariadb/install/my.cnf
fi
