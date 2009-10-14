<?php
 require('Smarty.class.php');
 include("../secure/smarty.cfg");

 $smarty = new Smarty();

 $smarty->template_dir = $smarty_tmpl_dir;
 $smarty->compile_dir = $smarty_tmplc_dir;
 $smarty->cache_dir = $smarty_cache_dir;
 $smarty->config_dir = $smarty_config_dir;
 
 $request = NULL;
 if(isset($_GET) and count($_GET) > 0) $request = $_GET;
 else if(isset($_POST)and count($_POST) > 0) $request = $_POST;

 if($request != NULL and count($request) > 0) {
	if(isset($request['data'])) {
   $request = get_object_vars(json_decode(str_replace("\\", "", $request['data'])));

   mysql_connect("localhost","testbed","testbed");
   mysql_select_db("testbed");
		
   $gname=$request['group'];
   $query="select devices.id, devices.name from devices,devicegroupmembers,devicegroups where ".
          "devicegroupmembers.deviceid=devices.id and devicegroupmembers.groupid = devicegroups.id ".
          "and devicegroups.name = '$gname'";
          
   $sqlresult=mysql_query($query);
   $group_data = array();
   while ($row = mysql_fetch_assoc($sqlresult))
   { 
 		array_push($group_data, array(
     		'id' => $row['id'],
     		'name' => $row['name'],
     		)
  	);
   }
   
   $sqlresult=mysql_query("select * from deviceconfig");
   $config_data = array();
   while ($row = mysql_fetch_assoc($sqlresult))
   {
   	array_push($config_data, array(
          		'id' => $row['id'],
           		'name' => $row['name'],
          		)
      		);
 	 }
 	 
   $smarty->assign('group_data', $group_data);
	 $smarty->assign('config_data', $config_data);
	 
	 mysql_close();
	 
	 $smarty->display('measurementsetup.tpl');
  }
 } 
?>
