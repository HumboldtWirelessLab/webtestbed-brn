<?php
 mysql_connect("localhost","testbed","testbed");
 mysql_select_db("testbed");
 
 switch  ( $operation ) {
 	case "add":
 		$nodegroup=$request['group'];
 		$config=$request['config'];
 		$runtime=$request['runtime'];
 		
 		if((isset($request['upload'])) && ($_FILES['clickfile']['size'] >  0))
 		{
 			$result=mysql_query("select * from deviceconfig where name like '$config'");
 			$row = mysql_fetch_assoc($result);
 			$config_id = $row['id'];
            
            $result=mysql_query("select * from devicegroups where name like '$nodegroup'");
 			$row = mysql_fetch_assoc($result);
 			$devicegroup_id = $row['id'];
             			
 			$fileName = $_FILES['clickfile']['name'];
            $tmpName  = $_FILES['clickfile']['tmp_name'];
            $fileSize = $_FILES['clickfile']['size'];
            $fileType = $_FILES['clickfile']['type'];
          
            $fp      = fopen($tmpName, 'r');
            $content = fread($fp, filesize($tmpName));
            $content = addslashes($content);
            fclose($fp);
          
			if(!get_magic_quotes_gpc())
			{
    			$fileName = addslashes($fileName);
			}
			
			$query = "INSERT INTO measurement  ( devicegroupid, clickfile, clickfilename, deviceconfig, userid, runtime, state ) ".
			  "VALUES ('$devicegroup_id', '$content', '$fileName', '$config_id', '1', '$runtime', '1')";

			mysql_query($query); 

		}
 		break;
 		
    case "show":
    	$query = "SELECT dc.name AS configname, m.id, dg.name, m.clickfilename, u.name AS username, m.runtime, ms.statename, m.resultfile".
    	" FROM measurement m LEFT OUTER JOIN users u ON u.id = m.userid, measurementstate ms, devicegroups dg, deviceconfig dc".
    	" WHERE m.devicegroupid = dg.id AND m.state = ms.id AND m.deviceconfig = dc.id";
    	$measurements=mysql_query($query);
		$meas_data = array();
		while ($measrow = mysql_fetch_assoc($measurements))
		{ 
		   array_push($meas_data, array(
      		   'id' => $measrow['id'],
               'devicegroup' => $measrow['name'],
               'clickfilename' => $measrow['clickfilename'],
               'configname' => $measrow['configname'],
               'username' => $measrow['username'],
               'runtime' => $measrow['runtime'],
               'state' => $measrow['statename'],
               'resultfile' => $measrow['resultfile']     
            )
        );
	 }
    case "nothing":
 	default:
 	    
 		$result=mysql_query("select * from devicegroups");
 		$group_data = array();
 		while ($row = mysql_fetch_assoc($result))
 		{ 
   			array_push($group_data, array(
            		'id' => $row['id'],
            		'name' => $row['name'],
            		)
        		);
 		}
 		
 		$result=mysql_query("select * from deviceconfig");
 		$config_data = array();
 		while ($row = mysql_fetch_assoc($result))
 		{ 
   			array_push($config_data, array(
            		'id' => $row['id'],
            		'name' => $row['name'],
            		)
        		);
 		}

 		$snodecfg = array();
 		$gid = $group_data[0]['id'];
 		$result=mysql_query("select devices.id, devices.name from devices,devicegroupmembers where devicegroupmembers.groupid=$gid and devicegroupmembers.deviceid=devices.id");
 		while ($row = mysql_fetch_assoc($result))
 		{ 
   			array_push($snodecfg, array(
            		'id' => $row['id'],
            		'name' => $row['name'],
            		)
        		);
 		}
 		break;
 }       

 mysql_close();
?>
