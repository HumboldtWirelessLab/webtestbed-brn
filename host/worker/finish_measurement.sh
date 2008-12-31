#!/bin/sh

if [ "x$1" != "x" ]; then
    ssh root@192.168.10.3 "rm -rf /var/www/testbed/html/result/$1"
    ssh root@192.168.10.3 "mkdir /var/www/testbed/html/result/$1"
    (cd $1;scp result.tar.bz2 root@192.168.10.3:/var/www/testbed/html/result/$1/ > /dev/null)

    rm -rf $1
fi

exit 0

