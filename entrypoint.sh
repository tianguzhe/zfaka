#!/bin/sh

set -e

if [ "$1" = 'php' ] && [ "$(id -u)" = '0' ]; then
    chown -R www-data /var/www/html
fi

if [ ! -e '/var/www/html/public/index.php' ]; then
    cp -a /app/* /var/www/html/
fi

exec "$@"