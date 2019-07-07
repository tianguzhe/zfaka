#!/bin/sh

set -e

if [ "$1" = 'php' ] && [ "$(id -u)" = '0' ]; then
    chown -R www-data /zfaka
fi

if [ ! -e '/zfaka/public/index.php' ]; then
    cp -a /app/* /zfaka/
fi

exec "$@"
