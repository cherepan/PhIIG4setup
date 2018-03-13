#! /usr/bin/perl
use Cwd;
use POSIX;
use POSIX qw(strftime);

#############################################
$numArgs = $#ARGV +1;
$ARGV[$argnum];

$UserID= POSIX::cuserid();
$UserIDCern=$UserID;
$UserDir="";
$PWD=getcwd;


if($ARGV[0] eq "--help" ){
    printf("\n\n\n ========================================================================================");
    printf("\nWelcome to quick Geant4 setup.");
    printf("\n./todo.pl --help                                             Prints this message"); 
    printf("\n./todo.pl --version <N>                                      Unpack the corresponding version of file from Patrick;  ");
    printf("\n  ========================================================================================\n");
    exit(0);  
}


for($l=0;$l<$numArgs; $l++){
    if($ARGV[$l] eq "--version"){
	$PAversion=$ARGV[l+1];


	$SLDP='\$G4DIR';
	$SPWD='\$PWD';
	$time= strftime("%h_%d_%Y",localtime);
	
	system(sprintf("rm Install_G4Env_*"));
	
	system(sprintf("echo \"/libcern/use/use.py geant4;\">> Install_G4Env_$time"));
	system(sprintf("echo \"/libcern/use/use.py gcc;\">> Install_G4Env_$time"));
	system(sprintf("echo \"cd /libcern/geant4/4.10.03-p02/sl6.6-x86_64-gate/bin/;\">> Install_G4Env_$time"));
	system(sprintf("echo \"source geant4.sh;\">> Install_G4Env_$time"));
	system(sprintf("echo \"cd $PWD;\">> Install_G4Env_$time"));
	system(sprintf("echo \"export G4INSTALL=/libcern/geant4/4.10.03-p02/geant4.10.03.p02/;\">> Install_G4Env_$time"));
	system(sprintf("echo \"gunzip -d PhaseIIBeam_v$PAversion.tar.gz\">> Install_G4Env_$time"));
	system(sprintf("echo \"tar -xvf PhaseIIBeam_v$PAversion.tar\">> Install_G4Env_$time"));
	system(sprintf("echo \"mkdir PhaseIIBeam_v$PAversion-build\">> Install_G4Env_$time"));
	system(sprintf("echo \"cd PhaseIIBeam_v$PAversion-build\">> Install_G4Env_$time"));
	system(sprintf("echo \"cmake -DGeant4_DIR=$SLDP ../PhaseIIBeam_v$PAversion/\">> Install_G4Env_$time"));
	system(sprintf("echo \"make -j2\">> Install_G4Env_$time"));
	system(sprintf("echo \"source /libcern/root/5.34.18/sl6.3-x86_64/setup.sh \n\">> Install_G4Env_$time"));
    }
}

# below is default g4 example, will be completed later
#system(sprintf("echo \"cp -r  /libcern/geant4/4.10.03-p02/sl6.6-x86_64-gate/share/Geant4-10.3.2/examples/basic/B1 .\">> Install_G4Env_$time"));
#system(sprintf("echo \"mkdir B3build\">> Install_G4Env_$time"));
#system(sprintf("echo \"cd B3build/\">> Install_G4Env_$time"));
#system(sprintf("echo \"cmake -DGeant4_DIR=$SLDP ../B1/\">> Install_G4Env_$time"));
#system(sprintf("echo \" make -j2\">> Install_G4Env_$time"));
