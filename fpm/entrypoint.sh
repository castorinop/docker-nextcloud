#!/bin/sh

ENABLE=${XDEBUG_ENABLE:-0}

if [ "$ENABLE" ]; then
set -ex \
    && { \
    echo '[xdebug]'; \
    echo 'zend_extension=xdebug.so'; \
    echo "xdebug.remote_enable=$ENABLE"; \
    [ -n "$XDEBUG_PORT" ] && echo "xdebug.remote_port=$XDEBUG_PORT"; \
    [ -n "$XDEBUG_HOST" ] && echo "xdebug.remote_host=$XDEBUG_HOST"; \
    echo 'xdebug.remote_connect_back=1'; \
    echo 'xdebug.remote_handler=dbgp'; \
    echo 'xdebug.remote_mode=req'; \
    echo "xdebug.remote_autostart=1"; \
    } | tee /etc/php7/php-fpm.d/xdebug.ini
else
  echo "; disabled xdebug" | tee /etc/php7/php-fpm.d/xdebug.ini
fi

php-fpm7 $@
