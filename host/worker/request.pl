#!/usr/bin/perl -w                                                                                                                                                                                               
use DBI;                                                                                                                                                                                                         
use ConfigReader;

#read config
#print $ARGV[0];
my %allconfig = &ConfigReader::read_config($ARGV[0]);
                                                                                                                                                                                                                 
# Connect To Database                                                                                                                                                                                            
$database = "testbed";                                                                                                                                                                                               
$username = "testbed";                                                                                                                                                                                              
$password = "testbed";                                                                                                                                                                                        
$hostname = $allconfig{'dbhost'};                                                                                                                                                                                         
$db = DBI->connect("DBI:mysql:$database:$hostname", $username, $password );                                                                                                                                      
                                                                                                                                                                                                                 
$query = $db->prepare("SELECT id,devicegroupid,clickfile,clickfilename,deviceconfig,runtime,state FROM measurement");                                                                                                                                                       
$query->execute;

while (@array = $query->fetchrow_array) {
	($mid,$mdevgrpid,$mclickfile,$mclickfilename,$mdevconf,$mruntime,$mstate) = @array;
	
	if ( $mstate == "1" ) {
	
		my $members = "";
		$devquery = $db->prepare("SELECT devices.name as devname FROM devicegroupmembers,devices where devicegroupmembers.groupid='$mdevgrpid' and devicegroupmembers.deviceid=devices.id");                                                                                                                                                       
		$devquery->execute;
		
		while (@devarray = $devquery->fetchrow_array) {
			($dev) = @devarray;
			$members .= " $dev"
		}	
		
		$confquery = $db->prepare("SELECT channel,macclone,channelswitch,cca,power,wifitype FROM deviceconfig where id='$mdevconf'"); 
		$confquery->execute;
		
		while (@confarray = $confquery->fetchrow_array) {
			($channel,$macclone,$channelswitch,$cca,$power,$wifitype) = @confarray;
		}

		system("mkdir $mid");
		open(FILE,"> $mid/$mclickfilename") or die "Error\n";
		syswrite FILE, $mclickfile;
		close FILE;
		open(FILE,"> $mid/config") or die "Error\n";
		print FILE "DEVICES=\"$members\"\n";
		print FILE "RUNTIME=\"$mruntime\"\n";
		print FILE "CLICKFILE=\"$mclickfilename\"\n";
		print FILE "CHANNEL=\"$channel\"\n";
		print FILE "MACCLONE=\"$macclone\"\n";
		print FILE "CHANNELSWITCH=\"$channelswitch\"\n";
		print FILE "CCA=\"$cca\"\n";
		print FILE "POWER=\"$power\"\n";
		print FILE "WIFITYPE=\"$wifitype\"\n";
		print FILE "ID=\"$mid\"\n";
		close FILE;
		
		$confquery = $db->prepare("UPDATE measurement SET state = 2 WHERE id='$mid'");
		$confquery->execute;
		
		system("./prepare_measurementfiles.sh $mid $ARGV[0]");
		system("./run_measurement.sh $mid $ARGV[0]");
		system("./finish_measurement.sh $mid $ARGV[0]");

    #emailnotifier
    $mailusername = $allconfig{'mailusername'};
    $mailserver = $allconfig{'mailserver'};
    $mailfrom = $allconfig{'mailfrom'};
    $mailto = $allconfig{'mailto'};
		$mn = $allconfig{'mailnotify'};
		
		if ( $mn eq "yes" ) {
		  system("sendEmail -f $mailfrom -t $mailto -u \"BRN-Testbed\" -m \"Ihre Messung ist beendet\" -s $mailserver:26 -o tls=yes -o username=$mailusername");
    }

		$confquery = $db->prepare("UPDATE measurement SET state = 3, resultfile='result/$mid/result.tar.bz2' WHERE id='$mid'");
		$confquery->execute;
		
	}
}

exit(0);
