FROM stephaneeybert/ubuntuos-mariadb:10.3.12


COPY startup.sh install/startup.sh

COPY my.cnf install/my.cnf
RUN ln -s /usr/local/mariadb/install/my.cnf ~/.my.cnf

COPY expand-secrets.sh /usr/local/mariadb/

COPY db-health-check.sh /usr/local/mariadb/
RUN chmod 744 /usr/local/mariadb/db-health-check.sh

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "install/startup.sh"]

# Build the container: docker build -t stephaneeybert/mariadb:10.3.12 .
# Rename the image: docker tag stephaneeybert/mariadb:10.3.12 thalasoft.com:5000/mariadb:10.3.12
# Push the image: docker push thalasoft.com:5000/mariadb:10.3.12
# Run the container: docker run -d --name mariadb -p 3307:3306 stephaneeybert/mariadb:10.3.12
# Check that the host port is open: nmap -p 3307 localhost
# Open a shell in the container: docker exec -it mariadb bash
# Open a mariadb client: /usr/local/mariadb/install/bin/mysql -u root -p
# View the mariadb log: tail -400f /usr/local/mariadb/install/logs/mariadb.error.log
# Connect from the host: cd programs/install/mariadb/; bin/mysql -h localhost -P 3307 --protocol=tcp -u root -p
# Stop the container: docker stop mariadb
# Delete the container: docker rm mariadb
