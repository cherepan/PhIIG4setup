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


system(sprintf("rm Install_G4Env_*"));
$SLDP='\$G4DIR';
$SPWD='\$PWD';
$time= strftime("%h_%d_%Y",localtime);

system(sprintf("rm Install_G4Env_*"));

system(sprintf("echo \"/libcern/use/use.py geant4;\">> Install_G4Env_$time"));
system(sprintf("echo \"source /libcern/root/5.34.18/sl6.3-x86_64/setup.sh \n\">> Install_G4Env_$time"));
system(sprintf("echo \"cd /libcern/geant4/4.10.03-p02/sl6.6-x86_64-gate/bin/;\">> Install_G4Env_$time"));
system(sprintf("echo \"source geant4.sh;\">> Install_G4Env_$time"));
system(sprintf("echo \"cd $PWD;\">> Install_G4Env_$time"));
system(sprintf("echo \"export G4INSTALL=/libcern/geant4/4.10.03-p02/geant4.10.03.p02/;\">> Install_G4Env_$time"));
system(sprintf("echo \"gunzip -d PhaseIIBeam_v1.tar.gz\">> Install_G4Env_$time"));
system(sprintf("echo \"tar -xvf PhaseIIBeam_v1.tar\">> Install_G4Env_$time"));
system(sprintf("echo \"mkdir PhaseIIBeam_v1-build\">> Install_G4Env_$time"));
system(sprintf("echo \"cd PhaseIIBeam_v1-build\">> Install_G4Env_$time"));
system(sprintf("echo \"cmake -DGeant4_DIR=$SLDP ../PhaseIIBeam_v1/\">> Install_G4Env_$time"));
system(sprintf("echo \" make -j2\">> Install_G4Env_$time"));

