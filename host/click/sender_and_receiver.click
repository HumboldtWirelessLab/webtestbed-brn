BRNAddressInfo(my_wlan NODEDEVICE:eth);

FROMDEVICE
  -> pw :: PrintWifi(TIMESTAMP true)
  -> ToDump("RESULTDIR/NODENAME.NODEDEVICE.dump");

BRN2PacketSource(1000, 100, 1000, 14, 22, 16)
  -> SetTimestamp()
  -> EtherEncap(0x8086, my_wlan, ff:ff:ff:ff:ff:ff)
  -> WifiEncap(0x00, 0:0:0:0:0:0)
  -> SetTXRate(22)
  -> wlan_out_queue :: NotifierQueue(50);
	  
wlan_out_queue
 -> SetTXPower(16)
 -> TODEVICE;
    
Script(
  wait RUNTIME,
  stop
);
