Starting the service in production
```  
sudo ./init-letsencrypt.sh
```

Configuration of the `init-letsencrypt.sh` file
```  
domains=(thalasoft.com www.thalasoft.com ngzero.thalasoft.com)
rsa_key_size=4096
data_path="/home/stephane/dev/docker/projects/common/volumes/letsencrypt/certbot"
email="mittiprovence@yahoo.se"
staging=0
```  
Deploying the source code in production
```  
scp init-letsencrypt.sh stephane@...:/home/stephane/dev/docker/projects/common/letsencrypt/
```  

The thalasoft.com certificates generated in the directory
```  
~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/archive/thalasoft.com
archive/
└── thalasoft.com
    ├── cert1.pem
    ├── chain1.pem
    ├── fullchain1.pem
    └── privkey1.pem
```  
are to be copied under the directory using the following filenames
```  
~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com
live/
├── README
└── thalasoft.com
    ├── current-cert.pem
    ├── current-chain.pem
    ├── current-fullchain.pem
    ├── current-privkey.pem
    └── README
```  
using the commands on the remote server
```  
cd /home/stephane/dev/docker/projects/common
sudo chown -R stephane volumes/letsencrypt/certbot/conf/live/thalasoft.com/
cp -f volumes/letsencrypt/certbot/conf/archive/thalasoft.com/cert1.pem volumes/letsencrypt/certbot/conf/live/thalasoft.com/current-cert.pem
cp -f volumes/letsencrypt/certbot/conf/archive/thalasoft.com/privkey1.pem volumes/letsencrypt/certbot/conf/live/thalasoft.com/current-privkey.pem
cp -f volumes/letsencrypt/certbot/conf/archive/thalasoft.com/chain1.pem volumes/letsencrypt/certbot/conf/live/thalasoft.com/current-chain.pem 
cp -f volumes/letsencrypt/certbot/conf/archive/thalasoft.com/fullchain1.pem volumes/letsencrypt/certbot/conf/live/thalasoft.com/current-fullchain.pem
```  
using the commands on the local machine
```  
cd /home/stephane/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com
scp stephane@...:/home/stephane/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com/current-* .
```  

An Apache virtual host configuration example
```  
  SSLCertificateFile "/usr/bin/learnintouch/letsencrypt/current-cert.pem"
  SSLCertificateKeyFile "/usr/bin/learnintouch/letsencrypt/current-privkey.pem"
  SSLCertificateChainFile "/usr/bin/learnintouch/letsencrypt/current-chain.pem"
```  

See https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71

