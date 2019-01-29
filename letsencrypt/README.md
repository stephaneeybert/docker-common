Starting the service in production
```  
sudo ./init-letsencrypt.sh
```

Set the staging value to 1 if tetsting the installation
```  
vi init-letsencrypt.sh
staging=0
```  

The thalasoft.com certificates are created under the directory
```  
~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/thalasoft.com
```  
An Apache virtual host configuration example
```  
<VirtualHost *:443>
  ServerName www.thalasoft.com
  DocumentRoot /usr/bin/learnintouch/www/thalasoft.com
  SSLEngine on
  SSLCertificateFile "/usr/bin/learnintouch/letsencrypt/cert.pem"
  SSLCertificateKeyFile "/usr/bin/learnintouch/letsencrypt/privkey.pem"
  SSLCertificateChainFile "/usr/bin/learnintouch/letsencrypt/fullchain.pem"
</VirtualHost>
```  

See https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71

