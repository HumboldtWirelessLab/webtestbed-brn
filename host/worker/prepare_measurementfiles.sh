#!/bin/sh

echo "Prepare Scripts"

. $2
. $1/config

cat > $1/monitor.$1 << EOF
RECOMMENDMODOPTIONS=modoptions.default

MODE=monitor

CHANNEL=$CHANNEL

POWER=$POWER

DIVERSITY=0

TXANTENNA=1

RXANTENNA=1

WIFITYPE=$WIFITYPE

INTMIT=0

EOF

cat > $1/testbed_$1.dis << EOF
NAME=testbed_$1
SIMULATOR=ns2
RADIO=shadowing11b
FORGEINNODES=no

TIME=$RUNTIME

NODETABLE=testbed_$1.mes
NODEPLACEMENTFILE=placement.default

LOGDIR=WORKDIR
LOGFILE=measurement.log

RESULTDIR=WORKDIR
EVALUATIONSDIR=WORKDIR
EVALUATIONSDIRPOSTFIX=_evaluation

GPS=no
NOTICE=no
LOS=no

EOF

echo "#NODE	DEVICE	MODULSDIR				MODOPTIONS	WIFICONFIG		CLICKMODDIR	CLICKSCRIPT		CLICKLOGFILE			APPLICATION		APPLICATIONLOGFILE" > $1/testbed_$1.mes
for i in $DEVICES; do
echo "$i ath0	BASEDIR/nodes/lib/modules/i586		-		CONFIGDIR/monitor.$1	-		CONFIGDIR/$CLICKFILE		LOGDIR/$i.ath0.log	-			-" >> $1/testbed_$1.mes
done

exit 0
