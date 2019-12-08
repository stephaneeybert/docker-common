#!/bin/bash -x

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
source /usr/local/postgresql/expand-secrets.sh

# Avoid having to provide the user password on the command line
export PGPASSWORD=$DB_ROOT_PASSWORD

/usr/local/postgresql/install/bin/psql -U postgres -c "SELECT version();" || exit 1
