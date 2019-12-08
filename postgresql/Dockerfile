FROM stephaneeybert/ubuntuos-postgresql:12.1


COPY startup.sh /usr/local/postgresql/install/
RUN chmod 744 /usr/local/postgresql/install/startup.sh

COPY expand-secrets.sh /usr/local/postgresql/

COPY db-health-check.sh /usr/local/postgresql/
RUN chmod 744 /usr/local/postgresql/db-health-check.sh

RUN adduser postgres --gecos '' --disabled-login

RUN mkdir /usr/local/postgresql/install/data \
  && mkdir /usr/local/postgresql/install/logs \
  && chown -R postgres /usr/local/postgresql/install/

#COPY postgresql.conf /usr/local/postgresql/install/data
#COPY pg_hba.conf /usr/local/postgresql/install/data

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "install/startup.sh"]

# Build the container: docker build -t stephaneeybert/postgresql:12.1 .
# Rename the image: docker tag stephaneeybert/postgresql:12.1 thalasoft.com:5000/postgresql:12.1
# Push the image: docker push thalasoft.com:5000/postgresql:12.1
# Run the container: docker run -d --name postgresql -p 5433:5432 stephaneeybert/postgresql:12.1
# Check that the host port is open: nmap -p 5433 localhost
# Open a shell in the container: docker exec -it postgresql bash
# Open a postgresql client: /usr/local/postgresql/install/bin/psql -U root -p
# View the postgresql log: tail -400f /usr/local/postgresql/install/logs/postgresql.error.log
# Connect from the host: cd programs/install/postgresql/; bin/mysql -h localhost -P 5433 --protocol=tcp -u root -p
# Stop the container: docker stop postgresql
# Delete the container: docker rm postgresql
