FROM centos:centos6

ENV PHP_VERSION 5.3.3
ENV DIR $HOME
ENV TIMEZONE America/Argentina/Buenos_Aires
RUN yum -y install epel-release
RUN yum -y install ca-certificates
#RUN yum -y install inotify-tools
RUN yum -y install vim-minimal
RUN yum -y install pwgen
#RUN yum -y install python-setuptools
#RUN yum -y install unrar
RUN yum -y install unzip
RUN yum -y install wget
RUN yum -y install tar
RUN yum -y install git
#RUN yum -y install whoiam
RUN yum -y install ksh
#RUN yum -y install gcc
RUN yum -y install hg 
RUN yum -y install php-$PHP_VERSION
#RUN yum -y install php-devel-$PHP_VERSION
RUN yum -y install php-bcmath-$PHP_VERSION
RUN yum -y install php-cli-$PHP_VERSION
RUN yum -y install php-common-$PHP_VERSION
RUN yum -y install php-fpm-$PHP_VERSION
RUN yum -y install php-intl-$PHP_VERSION
RUN yum -y install php-mbstring-$PHP_VERSION
RUN yum -y install php-mcrypt-$PHP_VERSION
RUN yum -y install php-password-compat
RUN yum -y install php-pdo-$PHP_VERSION
RUN yum -y install php-pear
RUN yum -y install php-pecl-apc
RUN yum -y install php-pecl-igbinary
RUN yum -y install php-pecl-memcache
RUN yum -y install php-pecl-memcached
RUN yum -y install php-pecl-mongo
RUN yum -y install php-pecl-redis
RUN yum -y install php-pgsql-$PHP_VERSION
RUN yum -y install php-process-$PHP_VERSION
RUN yum -y install php-redis
RUN yum -y install php-soap-$PHP_VERSION
RUN yum -y install php-xml-$PHP_VERSION 
RUN yum -y install php-pecl-ssh2
RUN yum -y install which
# Clients
RUN yum -y install postgresql
RUN yum -y install mysql
RUN yum -y install zsh
RUN yum -y install vim
RUN yum clean all
ENV TERM=xterm 
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
 
RUN sed -i "s/plugins=(git)/plugins=(git dirhistory common-aliases symfony2 git-remote-branch)/g" /root/.zshrc
#
# configuracion de php.ini
#
RUN mkdir -p /data/etc/php

RUN rm /etc/php.d -Rf
RUN rm /etc/php.ini -Rf
#---------------------------
#
#---------------------------
ADD etc /etc
ADD gitconfig /root/.gitconfig
RUN sed -i $(echo "s/{TIMEZONE}/$(echo $TIMEZONE | sed -e 's/\//\\\//g')/g") /etc/php.d/date.ini 
RUN ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime

WORKDIR /data
EXPOSE 9000
 
ENV PATH $PATH:/php/bin

ENTRYPOINT exec php-fpm --fpm-config /etc/php-fpm.d/www.conf -RF