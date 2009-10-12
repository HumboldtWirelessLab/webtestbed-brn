#!/bin/sh

if [ "x$1" == "x" ]; then
  echo "Use $0 Config-file"

while true; do
    sleep 10;
    ./request.pl $1
done

exit 0
