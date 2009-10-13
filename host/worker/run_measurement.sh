#!/bin/sh

. $2

if [ "x$MODE" = "xsim" ]; then
  (cd $1; $HELPER_HOME/simulation/bin/ns2-sim.sh run ./testbed_$1.dis 1)
else
  mv $1 $MEASUREMENTDIR
  (cd $MEASUREMENTDIR/$1; $HELPER_HOME/measurement/bin/run_measurement.sh ./testbed_$1.dis 1)
  mv $MEASUREMENTDIR/$1 .
fi
(cd $1; rm -rf result; rm -rf result.tar.bz2)
(cd $1; mv ./1 ./result; tar cvfj ./result.tar.bz2 ./result > /dev/null)

exit 0

