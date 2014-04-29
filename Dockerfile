FROM debian:wheezy
MAINTAINER Tamás Szalai <tamas.szalai@gmail.com>

RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install supervisor wget libxml2 libxslt1.1 logrotate php5-fpm
RUN wget http://files.tuxhelp.org/hiawatha/hiawatha_9.5_amd64.deb
RUN dpkg -i hiawatha_9.5_amd64.deb

RUN rm /etc/php5/fpm/pool.d/www.conf
ADD ./container_scripts/www.conf /etc/php5/fpm/pool.d/www.conf
RUN /etc/init.d/php5-fpm start

RUN rm /etc/hiawatha/hiawatha.conf
ADD ./container_scripts/hiawatha.conf /etc/hiawatha/hiawatha.conf

ADD ./web_root/ /var/www/tester/

ADD ./container_scripts/start.sh /start.sh
ADD ./container_scripts/run.sh /run.sh
RUN chmod 755 /*.sh
ADD ./container_scripts/supervisord-hiawatha.conf /etc/supervisor/conf.d/supervisord-hiawatha.conf
ADD ./container_scripts/supervisord-php.conf /etc/supervisor/conf.d/supervisord-php.conf

EXPOSE 80

CMD ["/run.sh"]
