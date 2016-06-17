#!/bin/bash
cd libs
tar zxfv phpredis-master-2.2.4.tar.gz
cd phpredis-master-2.2.4
/server/php5.3/bin/phpize --with-php-config=/server/php5.3/bin/php-config
./configure
make && make install
cd ..
rm -rf phpredis-master-2.2.4/
if [ -f "/server/php5.3/lib/php/extensions/no-debug-non-zts-20090626/redis.so" ];then
    echo "[redis]">/server/php5.3/etc/conf.d/redis.ini
    echo "extension=redis.so">>/server/php5.3/etc/conf.d/redis.ini
    /server/php5.3/bin/php -m
fi
echo "done."
