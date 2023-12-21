FROM alpine:3.18


RUN apk -U upgrade && apk add php php-phar php-fpm php-mysqli php-iconv mysql-client \
 php-json php-curl php-dom php-exif php-fileinfo php-mbstring php-openssl php-xml php-zip \
 php-tokenizer php-session
COPY conf/php.conf /etc/php81/php-fpm.d/www.conf

WORKDIR /var/www/thi-le.42.fr
RUN wget https://wordpress.org/latest.tar.gz -O latest.tar.gz
RUN tar xzf latest.tar.gz && rm latest.tar.gz && mv wordpress/* . \
	&& rmdir wordpress
RUN ls -la
RUN pwd


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && chmod +x wp-cli.phar && mv wp-cli.phar /bin/wp

COPY ./tool/entrypoint.sh /etc/entrypoint.sh

ENTRYPOINT ["sh", "/etc/entrypoint.sh"]
