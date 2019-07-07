FROM baiyuetribe/zfaka:alpine 

MAINTAINER azure <https://baiyue.one>
#每月自动更新至ZFAKA-master稳定版分支
ARG SOURCE=https://github.com/zlkbdotnet/zfaka/archive/master.zip
WORKDIR /app
ADD default.conf .
RUN wget -q ${SOURCE} && unzip master.zip && mv zfaka-master/* . && rm master.zip && rm -rf zfaka-master && \
    cp conf/application.ini.new conf/application.ini && \
    chmod a+w conf/application.ini && \
    chmod -R a+w+r install/ && \
    chmod -R a+w+r temp && \
    chmod -R a+w log 
WORKDIR /var/www/html
COPY entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["php-fpm"]

