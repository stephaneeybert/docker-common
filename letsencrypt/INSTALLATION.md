Installation

On the remote

Create the letsencrypt directory
```  
mkdir -p ~/dev/docker/projects/common/letsencrypt/;
```

On the local

Copy the source code
```  
cd ~/dev/docker/projects/common/letsencrypt/;
scp docker-compose.yml init-letsencrypt.sh stephane@thalasoft.com:~/dev/docker/projects/common/letsencrypt/
```  

On the remote

Obtain new certificates
```  
cd ~/dev/docker/projects/common/letsencrypt/;
sudo ./init-letsencrypt.sh
```

On the local

Copy the certificates from the remote server to the local machine
```  
cd ~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com;
scp stephane@thalasoft.com:/home/stephane/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com/current-* .
```  

Import the certificates in the keystore on the local machine  
For this, see how to enable HTTPS for a domain name in the ssh help file
