Installation

On the remote

Create some directories
```  
mkdir -p ~/dev/docker/projects/common/letsencrypt/nginx;
sudo chown -R stephane:stephane ~/dev/docker/projects/common/letsencrypt/
sudo chmod -R 744 ~/dev/docker/projects/common/letsencrypt;
mkdir -p ~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com;
mkdir -p ~/dev/docker/projects/common/volumes/letsencrypt/nginx
sudo chown -R stephane:stephane ~/dev/docker/projects/common/volumes;
sudo chmod -R 744 ~/dev/docker/projects/common/volumes;
```

On the local

Copy the source code
```  
cd ~/dev/docker/projects/common/letsencrypt/;
scp docker-compose.yml init-letsencrypt.sh stephane@thalasoft.com:~/dev/docker/projects/common/letsencrypt
scp nginx/app.conf stephane@thalasoft.com:~/dev/docker/projects/common/volumes/letsencrypt/nginx
```  

Copy the SSL private key file
```
cd ~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com;
scp current-privkey.pem stephane@thalasoft.com:~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com/
```

On the remote

Do a dry run before requesting the real certificates
In the init-letsencrypt.sh file have
```
staging=1 
```

Do the ACME challenge to obtain new certificates
```
cd ~/dev/docker/projects/common/letsencrypt/;
sudo ./init-letsencrypt.sh
```

On the local

Copy the certificates from the remote server to the local machine
```  
cd ~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com;
scp stephane@thalasoft.com:~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com/current-* .
```  

Import the certificates in the keystore on the local machine  
For this, see 'Enabling HTTPS on a domain name' in the ssh help file

Debugging the certbot
cd ~/dev/docker/projects/common/letsencrypt/;
sudo ./init-letsencrypt.sh
then
docker run --entrypoint="/bin/sh" -it -v "/home/stephane/dev/docker/projects/common/volumes/letsencrypt/certbot/conf:/etc/letsencrypt" -v "/home/stephane/dev/docker/projects/common/volumes/letsencrypt/certbot/www:/var/www/certbot" -v "/home/stephane/dev/docker/projects/common/volumes/logs:/var/log/letsencrypt" --name certbot certbot/certbot:latest
echo '' > /var/log/letsencrypt/letsencrypt.log
certbot certonly --webroot -w /var/www/certbot --staging --email mittiprovence@yahoo.se -d thalasoft.com --rsa-key-size 4096 --agree-tos --force-renewal
less /var/log/letsencrypt/letsencrypt.log
or
docker-compose run -d --rm --entrypoint 'certbot certonly --webroot -w /var/www/certbot --staging --email mittiprovence@yahoo.se -d thalasoft.com --rsa-key-size 4096 --agree-tos --force-renewal ; sleep 3600' certbot
