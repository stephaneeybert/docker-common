FROM stephaneeybert/ubuntuos:18.04

RUN apt-get update \
  && apt-get install -y fail2ban

RUN echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections \
  && echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
RUN apt-get install -y iptables-persistent

RUN apt-get install -y iptables sudo
RUN adduser root sudo

WORKDIR /etc/fail2ban/

RUN mkdir /usr/local/fail2ban/

COPY startup.sh /etc/fail2ban/startup.sh
RUN chmod 744 /etc/fail2ban/startup.sh

COPY jail.local /etc/fail2ban/
COPY sshd.conf learnintouch-admin.fail2ban.conf /etc/fail2ban/filter.d/

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/etc/fail2ban/startup.sh"]

# Build the container: docker build -t stephaneeybert/fail2ban .
# Rename the image: docker tag stephaneeybert/fail2ban thalasoft.com:5000/fail2ban
# Push the image: docker push thalasoft.com:5000/fail2ban
# Run the container: docker run -d --name fail2ban stephaneeybert/fail2ban
# Open a shell in the container: docker exec -it fail2ban bash
