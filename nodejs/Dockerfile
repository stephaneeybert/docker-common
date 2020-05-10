FROM stephaneeybert/ubuntuos:18.04

RUN apt-get update \
  && apt-get purge nodejs

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash \
  && apt-get install -y nodejs \
  && apt-get install -y npm

# TODO run the service not as root (and the same for the other services)
#RUN useradd --user-group --create-home --shell /bin/false stephane
#USER stephane

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]

# Build the container: docker build -t stephaneeybert/nodejs .
# Rename the image: docker tag stephaneeybert/nodejs thalasoft.com:5000/nodejs
# Push the image: docker push thalasoft.com:5000/nodejs
# Run the container: docker run -d -p 9001:9001 --name nodejs stephaneeybert/nodejs
# Check that the port is open: nmap -p 9001 localhost
# Open a shell in the container: docker exec -it nodejs bash
