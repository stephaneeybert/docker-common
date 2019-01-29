#!/bin/bash -x

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
source /usr/bin/mariadb/expand-secrets.sh

# Avoid having to provide the user password on the command line
export MYSQL_PWD=$DB_ROOT_PASSWORD

/usr/bin/mariadb/install/bin/mysql --protocol=tcp -h localhost -u root -e "SELECT 1;" || exit 1
