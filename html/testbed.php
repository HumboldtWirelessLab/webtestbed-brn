<?php
 mysql_connect("localhost","testbed","testbed");
 mysql_select_db("testbed");
 
 switch ($operation) {
 	case "addconfig":
 		$name=$request['name'];
 		$channel=$request['channel'];
 		$macclone=$request['macclone'];
 		$channelswitch=$request['channelswitch'];
 		$cca=$request['cca'];
 		$power=$request['power'];
 		$wifitype=$request['wifitype'];
 		
 		$query = "INSERT INTO deviceconfig ( name, channel, macclone, channelswitch, cca, power, wifitype ) VALUES ".
 		" ( '$name', '$channel', '$macclone', '$channelswitch', '$cca', '$power', '$wifitype')";
 		
 		$result = mysql_query($query);
 		
		break;
	case "changeconfig":
 	    $id=$request['id'];
 		
 		$result=mysql_query("delete from deviceconfig where deviceconfig.id='$id'");
 		
		break;	 
 	case "showconfig":
 		$result = mysql_query("select * from deviceconfig");
 		$config_list = array();
 		while ($row = mysql_fetch_assoc($result))
 		{ 
   			array_push($config_list, array(
            	'id' => $row['id'],
            	'name' => $row['name'],
            	'channel' => $row['channel'],
            	'macclone' => $row['macclone'],
            	'channelswitch' => $row['channelswitch'],
            	'cca' => $row['cca'],
            	'power' => $row['power'],
            	'wifitype' => $row['wifitype']
            	)
        	);
 		}
 		break;
 	case "addgroup":
 		echo $request['name'];
 		$name=$request['name'];
 		$devicelist=$request['device'];
 		
 		$query = "INSERT INTO devicegroups ( name ) VALUES ( '$name' )";
 		$result = mysql_query($query);
 		
 		$result = mysql_query("select * from devicegroups where name='$name'");
 		$row = mysql_fetch_assoc($result);
 		$group_id = $row['id'];
 
 		foreach ($devicelist as $dev) {
 			$query = "INSERT INTO devicegroupmembers ( groupid, deviceid ) VALUES ( '$group_id', '$dev' )";
 			$result = mysql_query($query);
 		}
 				
		break;
 	case "changegroup":
 	    $id=$request['id'];
 		
 		$result=mysql_query("delete from devicegroups where devicegroups.id='$id'");
 		$result=mysql_query("delete from devicegroupmembers where groupid='$id'");
 		
		break;	  
  	case "showgroup":
 		$result = mysql_query("select * from devicegroups");
 		$group_list = array();
 		while ($row = mysql_fetch_assoc($result))
 		{ 
 			$group_id = $row['id'];
 			
 			$dev_result = mysql_query("select * from devices,devicegroupmembers where devices.id=devicegroupmembers.deviceid and devicegroupmembers.groupid='$group_id'");
 			
 			$devices="";
 			while ($dev_row = mysql_fetch_assoc($dev_result))
 			{
 				$dev=$dev_row['name'];
 				if ( $devices=="" ) {
 					$devices=$dev;
				} else {
					$devices="$devices, $dev";
				}
 			}
 			 			
   			array_push($group_list, array(
            	'id' => $row['id'],
            	'name' => $row['name'],
            	'devices' => $devices
            	)
        	);
 		}
 		$result = mysql_query("select * from devices");
 		$device_list = array();
 		while ($row = mysql_fetch_assoc($result))
 		{ 
   			array_push($device_list, array(
            	'id' => $row['id'],
            	'name' => $row['name']
            	)
        	);
 		}
 		break;
 	case "adddevice":
 	    $name=$request['name'];
 		$place=$request['place'];
 		$state=$request['state'];
 		$comment=$request['comment'];
 	
 		$result=mysql_query("select * from devicestate where devicestate.statename='$state'");
 		$row = mysql_fetch_assoc($result);
 		$state_id = $row['id'];
 		
 		$query = "INSERT INTO devices ( name, place, state, comment ) VALUES ".
 		" ( '$name', '$place', '$state_id', '$comment')";
 		
 		$result = mysql_query($query);
 		
		break;	
 	case "changedevice":
 	    $id=$request['id'];
 		
 		$result=mysql_query("delete from devices where devices.id='$id'");
 		$result=mysql_query("delete from devicegroupmembers where deviceid='$id'");
 		
		break;
 	case "show":
 	default:
 		$result=mysql_query("select devices.id as devid, devices.name as devname, place, statename, devices.comment as devcomment from devices,devicestate where devices.state=devicestate.id");
 		$table_data = array();
 		while ($row = mysql_fetch_assoc($result))
 		{ 
   			array_push($table_data, array(
            	'id' => $row['devid'],
            	'name' => $row['devname'],
            	'place' => $row['place'],
            	'state' => $row['statename'],
            	'comment' => $row['devcomment']
            	)
        	);
 		}

 		$states=mysql_query("select * from devicestate");
 		$state_data = array();
 		while ($staterow = mysql_fetch_assoc($states))
 		{ 
   			array_push($state_data, array(
            	'id' => $staterow['id'],
            	'statename' => $staterow['statename']
            	)
        	);
 		}
 		break;
 }

 mysql_close();
?>
