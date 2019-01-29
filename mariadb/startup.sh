#!/bin/bash -x

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
source /usr/bin/mariadb/expand-secrets.sh

if [ ! -f /usr/bin/mariadb/install/data/ibdata1 ]; then
  chmod 755 /usr/bin/mariadb/install/scripts/mysql_install_db
  sleep 1 # Needed to avoid running the script when this mysql_install_db file has not yet been released by the permissions change
  /usr/bin/mariadb/install/scripts/mysql_install_db \
    --no-defaults \
    --explicit_defaults_for_timestamp \
    --basedir=/usr/bin/mariadb/install \
    --datadir=/usr/bin/mariadb/install/data \
    --tmpdir=/usr/bin/mariadb/install/tmp \
    --lc-messages-dir=/usr/bin/mariadb/install/share

  /usr/bin/mariadb/install/bin/mysqld_safe --defaults-file=/usr/bin/mariadb/install/my.cnf &
  sleep 10s
  /usr/bin/mariadb/install/bin/mysql -u root -v -e "grant all on *.* to root@'%' identified by '$DB_ROOT_PASSWORD' with grant option; flush privileges;"
  # The % does not include localhost so the same command has to be executed for specific hosts 
  /usr/bin/mariadb/install/bin/mysql -u root -v -e "grant all on *.* to root@'mysql' identified by '$DB_ROOT_PASSWORD' with grant option; flush privileges;"
  /usr/bin/mariadb/install/bin/mysql -u root -v -e "grant all on *.* to root@'localhost' identified by '$DB_ROOT_PASSWORD' with grant option; flush privileges;"

  # Avoid having to provide the user password on the command line
  # But only after having set the root password
  export MYSQL_PWD=$DB_ROOT_PASSWORD

  /usr/bin/mariadb/install/bin/mysql -u root -v -e "use mysql; delete from user where User = ''; flush privileges;"

  chown -R $HOST_USER_ID /usr/bin/mariadb/install/data
  chgrp -R $HOST_GROUP_ID /usr/bin/mariadb/install/data

  # tail -f /etc/hosts
else
  chown -R $HOST_USER_ID /usr/bin/mariadb/install/data
  chgrp -R $HOST_GROUP_ID /usr/bin/mariadb/install/data

  # Avoid having to provide the user password on the command line
  export MYSQL_PWD=$DB_ROOT_PASSWORD

  /usr/bin/mariadb/install/bin/mysqld_safe --defaults-file=/usr/bin/mariadb/install/my.cnf
fi
