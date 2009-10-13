#!/bin/sh

if [ "x$1" = "x" ]; then
  echo "Use $0 Config-file"
fi
while true; do
    sleep 1;
    ./request.pl $1
done

exit 0
