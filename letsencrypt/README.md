Configuration of the `init-letsencrypt.sh` file
```  
domains=(thalasoft.com www.thalasoft.com dev.thalasoft.com folkuniversitet.thalasoft.com ngzero.thalasoft.com)
rsa_key_size=4096
data_path="/home/stephane/dev/docker/projects/common/volumes/letsencrypt/certbot"
email="mittiprovence@yahoo.se"
staging=0
```  

An Apache virtual host configuration example
```  
  SSLCertificateFile "/usr/local/learnintouch/letsencrypt/current-cert.pem"
  SSLCertificateKeyFile "/usr/local/learnintouch/letsencrypt/current-privkey.pem"
  SSLCertificateChainFile "/usr/local/learnintouch/letsencrypt/current-chain.pem"
```  

See https://github.com/wmnnd/nginx-certbot/

The domains list includes the local dev subdomain. The script can be run in production only.
After it is run, the generated certificates are copied back from the production to the local dev.

The thalasoft.com certificates are generated in the directory
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
cd /home/stephane/dev/docker/projects/common;
sudo chown -R stephane volumes/letsencrypt/certbot/conf/live/thalasoft.com/;
\cp -f volumes/letsencrypt/certbot/conf/archive/thalasoft.com/cert1.pem volumes/letsencrypt/certbot/conf/live/thalasoft.com/current-cert.pem;
\cp -f volumes/letsencrypt/certbot/conf/archive/thalasoft.com/privkey1.pem volumes/letsencrypt/certbot/conf/live/thalasoft.com/current-privkey.pem;
\cp -f volumes/letsencrypt/certbot/conf/archive/thalasoft.com/chain1.pem volumes/letsencrypt/certbot/conf/live/thalasoft.com/current-chain.pem;
\cp -f volumes/letsencrypt/certbot/conf/archive/thalasoft.com/fullchain1.pem volumes/letsencrypt/certbot/conf/live/thalasoft.com/current-fullchain.pem;
sudo chown -R stephane volumes/letsencrypt/certbot/conf/live/thalasoft.com/
```  
The script has already done the above copying of the certificates. There is no need to manually type in the above copy commands.

Import the certificates in the keystore on the local machine  

See how to enable HTTPS for a domain name in the ssh help file
