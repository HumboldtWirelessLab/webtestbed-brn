#!/bin/sh

. $2

if [ "x$1" != "x" ]; then
  if [ "x$USESSH" = "xyes" ]; then
    ssh $SSHUSER@$SSHHOST "rm -rf $RESULTDIR/$1"
    ssh $SSHUSER@$SSHHOST "mkdir $RESULTDIR/$1"
    (cd $1;scp result.tar.bz2 $SSHUSER@$SSHHOST:$RESULTDIR/$1/ > /dev/null)
  else
    rm -rf $RESULTDIR/$1
    mkdir $RESULTDIR/$1
    (cd $1;cp result.tar.bz2 $RESULTDIR/$1/)
  fi
   
  rm -rf $1
fi

exit 0

