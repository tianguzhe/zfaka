FROM php:7.3.6-zts-alpine3.10 

MAINTAINER azure <https://baiyue.one>
#每月自动更新至ZFAKA-master稳定版分支
ENV TZ=Asia/Shanghai

ARG SOURCE=https://github.com/zlkbdotnet/zfaka/archive/master.zip

RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev autoconf gcc g++ make \
    && docker-php-ext-configure gd \
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NPROC} gd bcmath mysqli \
    && echo "安装 yaf" \
    && wget -c http://pecl.php.net/get/yaf-3.0.8.tgz \
    && tar zxf yaf-3.0.8.tgz \
    && cd yaf-3.0.8/ \
    && phpize \
    && ./configure --with-php-config=/usr/local/bin/php-config \
    && make \
    && make install \
    && make clean \
    && rm -rf ../yaf-3.0.8 \
    && rm -rf ../yaf-3.0.8.tgz \
    && echo "extension=yaf.so" >>/usr/local/etc/php/php.ini \
    && echo "yaf.environ='product'" >>/usr/local/etc/php/php.ini \
    && echo "yaf.use_namespace=1" >>/usr/local/etc/php/php.ini \
    && apk del --no-cache gcc g++ make
