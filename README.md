# Nginx with PHP-FPM

You need **javiervivanco/docker-dns** to configure in your local machine to resolve name 

## Run example

Linked with a container php-fpm server

    docker run -it --rm \
       --link server_123:php-fpm
       -v my_dir_dev/:/data/
       -p 80:80
       javiervivanco/docker-nginx-php-fpm


Out of container
  
    docker run -it --rm \
       --env PHP_FCGI_HOST=127.0.0.1 \
       --env PHP_FCGI_PORT=9000 \ 
       -v my_dir_dev/:/data/
       javiervivanco/docker-nginx-php-fpm


## Directory structure

    /data/<domain-name>/current/web

Example:
   
    /data/subdomain.mydomain.dev/current/web/index.php

    #$ curl subdomain.mydomain.dev 

    Hello.
    #/data/subdomain.mydomain.dev/current/web/index.php
    #$ curl www.mydomain.dev 

    Hello.

## Logs

   TODO
   
## PHP-FPM env

    PHP_FCGI_HOST php
    PHP_FCGI_PORT 9000


