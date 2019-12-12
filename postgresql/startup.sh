#!/bin/bash

# TODO Try logging in from the host: /usr/local/postgresql/install/bin/psql -h postgresql -p 5432 -U postgres

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
source /usr/local/postgresql/expand-secrets.sh

# Avoid having to provide the user password on the command line
# TODO This env var is not used: export PGPASSWORD=$DB_ROOT_PASSWORD

if [ ! -f /usr/local/postgresql/install/data/postgresql.conf ]; then
  # Do the post installation
  echo "Post installation..."
  
  # The container root user needs to run the server
  chmod -R 755 /usr/local/postgresql/install/bin/
  # Needed to avoid running the next command before the previous file has been released by the permissions change
  sleep 1

  # The data directory must be empty before doing the post installation
  rm -fr /usr/local/postgresql/install/data/*

  sudo -u postgres sh << EOF
/usr/local/postgresql/install/bin/initdb --auth-host password -D /usr/local/postgresql/install/data
EOF

  # Allow all IP addresses (in the 0.0.0.0/0 range) to make remote connections
  sed -i "s/host    all             all             127.0.0.1\/32/host    all             all             0.0.0.0\/0/" /usr/local/postgresql/install/data/pg_hba.conf
  # Listen (listening does not mean it accepts connections) to all IP addresses
  sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /usr/local/postgresql/install/data/postgresql.conf

  # Start the database server
  sudo -u postgres sh << EOF
/usr/local/postgresql/install/bin/pg_ctl -D /usr/local/postgresql/install/data -l /usr/local/postgresql/install/logs/postgres.log start
EOF
  sleep 10s

  # Configure the root user
  sudo -u postgres sh << EOF
#/usr/local/postgresql/install/bin/psql -U postgres -c "ALTER USER postgres with encrypted password '$DB_ROOT_PASSWORD';"
EOF

  # Restart the service to flush the changed user privileges
  sudo -u postgres sh << EOF
/usr/local/postgresql/install/bin/pg_ctl -D /usr/local/postgresql/install/data -l /usr/local/postgresql/install/logs/postgres.log restart
EOF
else
  # Start the database server
  echo "Server startup..."

  # There must not be any pid file before starting the server
  rm -f /usr/local/postgresql/install/data/postmaster.pid

  sudo -u postgres sh << EOF
/usr/local/postgresql/install/bin/pg_ctl -D /usr/local/postgresql/install/data -l /usr/local/postgresql/install/logs/postgres.log start
EOF
fi

# Keep the container running
tail -f /etc/hosts
