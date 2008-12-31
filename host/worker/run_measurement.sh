#!/bin/sh

(cd $1;../../../home/all/trash/measurement/lab/helper/simulation/bin/ns2-sim.sh run ./testbed_$1.dis 1)
(cd $1; rm -rf result; rm -rf result.tar.bz2)
(cd $1; mv ./1 ./result; tar cvfj ./result.tar.bz2 ./result > /dev/null)

exit 0

