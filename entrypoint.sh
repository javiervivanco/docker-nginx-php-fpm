#!/bin/sh


if [ -z $PHP_FCGI_HOST ]
then
    if [ ! -z $PHP_FPM_PORT ]; then
        PHP_FCGI_HOST="php-fpm"
        if [ -z PHP_FPM_PORT_9000_TCP_PORT ]; then
            echo "If is not port 9000 in your link container, please define it. --env=PHP_FCGI_PORT=9001" 1>&2
        fi
    else
        printenv
        echo "Please define your php-fpm host --env=PHP_FCGI_HOST=php or link container  --link server:php-fpm" 1>&2
        exit 1        
    fi
fi

if [ -z $PHP_FCGI_PORT ] 
then
    PHP_FCGI_PORT=9000
fi

if [ ! -f /etc/nginx/fastcgi.php.conf ]
then 
    echo -e "Config php-fpm"
    echo -e "\tHost: ${PHP_FCGI_HOST}"
    echo -e "\tPort: ${PHP_FCGI_PORT}"
    cp /etc/nginx/fastcgi.conf.dist /etc/nginx/fastcgi.php.conf
    sed -i "s/{FASTCGI_HOST}/$PHP_FCGI_HOST/g" /etc/nginx/fastcgi.php.conf
    sed -i "s/{FASTCGI_PORT}/$PHP_FCGI_PORT/g" /etc/nginx/fastcgi.php.conf
fi
echo ""
echo -e $(nginx -V)
echo -e "\nRun nginx"
nginx
