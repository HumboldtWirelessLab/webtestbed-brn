<?php

// put full path to Smarty.class.php
require('Smarty.class.php');
include("../secure/smarty.cfg");

$smarty = new Smarty();

$smarty->template_dir = $smarty_tmpl_dir;
$smarty->compile_dir = $smarty_tmplc_dir;
$smarty->cache_dir = $smarty_cache_dir;
$smarty->config_dir = $smarty_config_dir;

if(isset($_GET) and count($_GET) > 0) $request = $_GET;
else if(isset($_POST)and count($_POST) > 0) $request = $_POST;

switch ($request['menu']) {
  case "testbed":
	$smarty->assign('title', 'Testbed');
	$smarty->assign('menu', 'testbed');
	
	switch ($request['mode']) {
		case "group":
			switch ( $request['operation'] ) {
	    		case "add":
	    			$operation = 'addgroup';
			    	include 'testbed.php';
			    	break;
			    case "change":
	    			$operation = 'changegroup';
			    	include 'testbed.php';
			    	break;
	    		default:
	    	}
	    	
	 	    $operation = 'showgroup';
	    	include 'testbed.php';
	    	$smarty->assign('group_list', $group_list);
	 	    $smarty->assign('device_list', $device_list);
	 	    $smarty->assign('page', 'testbed_devicegroup');
	 	    
			break;
		case "config":
			switch ( $request['operation'] ) {
	    		case "add":
	    			$operation = 'addconfig';
			    	include 'testbed.php';
			    	break;
			    case "change":
	    			$operation = 'changeconfig';
			    	include 'testbed.php';
			    	break;
	    		default:
	    	}
	    	
	 	    $operation = 'showconfig';
	    	include 'testbed.php';
	    	$smarty->assign('config_list', $config_list);
	 	    $smarty->assign('page', 'testbed_config');
	 	    
			break;
		case "device":
			switch ( $request['operation'] ) {
	    		case "add":
	    			$operation = 'adddevice';
			    	include 'testbed.php';
			    	break;
	    		case "change":
	    			$operation = 'changedevice';
			    	include 'testbed.php';
			    	break;
	    		default:
	    	}
		case "show":
		default:
			$operation = 'show';
			include 'testbed.php';
			$smarty->assign('page', 'testbed');
			$smarty->assign('table_data', $table_data); // LOOP
			$smarty->assign('state_data', $state_data); // LOOP
	}
	
	break;
  case "measurement":
	$smarty->assign('title', 'Measurement');
	$smarty->assign('menu', 'measurement');
	
	switch ($request['mode']) {
	  case "add":
	  	$smarty->assign('page', 'measurement_add');
	  	$operation = 'nothing';
	    include 'measurement.php';
	    $smarty->assign('group_data', $group_data); // LOOP
      $smarty->assign('config_data', $config_data); // LOOP
      $smarty->assign('snodecfg', $snodecfg); // LOOP
      break;
	  case "operation":
	  
	    switch ( $request['operation'] ) {
	    	case "add":
	    		$operation = 'add';
			    include 'measurement.php';
	    		break;
	    	default:
	 	}
	 	
	  case "show":	
	  default:
	    $operation = 'show';
	    include 'measurement.php';
	    $smarty->assign('meas_data', $meas_data); // LOOP
		$smarty->assign('page', 'measurement_show');
	}
	
	break;
  case "impressum":
	$smarty->assign('title', 'Impressum');
	$smarty->assign('page', 'impressum');
	$smarty->assign('menu', 'impressum');
	
	break;
  case "home":
  default:
	$smarty->assign('title', 'Startseite');
	$smarty->assign('page', 'home');
	$smarty->assign('menu', 'home');
	
}

$smarty->display('index.tpl');

?>
