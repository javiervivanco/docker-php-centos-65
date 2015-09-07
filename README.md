# PHP 5.3.3 based on CentOS 6.5

It seems to Redhat 6.5 with EPEL 

# Include:

## Timezone

     America/Argentina/Buenos_Aires

## ENTRYPOINT

     exec php-fpm --fpm-config /etc/php-fpm.d/www.conf -RF

     php-fpm on PORT 9000

## Enviroment

     ENV PATH $PATH:/php/bin

For php tools in path like phpunit


### Directory

     WORKDIR /data

### php-fpm include php config files



     /etc/php-fpm.d/*.conf

### User php-FPM

    user                           = root
    group                          = root
    listen                         = 0.0.0.0:9000


## extensions:

  * apc
  * bcmath
  * curl
  * dom
  * fileinfo
  * igbinary
  * intl
  * json
  * mail
  * mbstring
  * mcrypt
  * memcached
  * memcache
  * mongo
  * pdo
  * pdo_pgsql
  * pdo_sqlite
  * pgsql
  * phar
  * posix
  * redis
  * safe-mode
  * session
  * soap
  * sqlite3
  * ssh2
  * sysvmsg
  * sysvsem
  * sysvshm
  * wddx
  * xmlreader
  * xmlwriter
  * xsl
  * zip
