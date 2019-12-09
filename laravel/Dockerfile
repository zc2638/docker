FROM php:7.2-fpm

# 安装php依赖以及nginx
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
	nginx git unzip openssl wget &&\ 
	docker-php-ext-install -j$(nproc) iconv &&\ 
	docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ &&\ 
	docker-php-ext-install -j$(nproc) gd &&\ 
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer &&\ 
	chmod +x /usr/local/bin/composer &&\
	composer -v &&\ 
	wget https://raw.githubusercontent.com/curl/curl/master/lib/mk-ca-bundle.pl &&\ 
	chmod 0777 mk-ca-bundle.pl &&\ 
	./mk-ca-bundle.pl &&\ 
	cp ca-bundle.crt /etc/ssl/certs/ca-certificates.crt -fr 

# 设置工作区
WORKDIR /var/www/

