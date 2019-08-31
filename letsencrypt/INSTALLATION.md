Installation

On the remote

Create some directories
```  
mkdir -p ~/dev/docker/projects/common/letsencrypt/nginx;
mkdir -p ~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com;
sudo chown -R stephane:stephane ~/dev/docker/projects/common/volumes;
sudo chmod -R 755 ~/dev/docker/projects/common/volumes;
sudo chown -R stephane:stephane ~/dev/docker/projects/common/letsencrypt/
```

On the local

Copy the source code
```  
cd ~/dev/docker/projects/common/letsencrypt/;
scp docker-compose.yml init-letsencrypt.sh stephane@thalasoft.com:~/dev/docker/projects/common/letsencrypt
scp nginx/app.conf stephane@thalasoft.com:~/dev/docker/projects/common/letsencrypt
```  

Copy the SSL private key file
```
cd ~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com;
scp current-privkey.pem stephane@thalasoft.com:~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com/
```

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
