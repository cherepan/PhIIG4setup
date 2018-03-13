# PhIIG4setup
PhaseIIBeam_v*.tar.gz are provided by Patrick Asenov (patrickasenov@gmail.com)

Quick Instruction:
open an empty shell.
run ./todo.pl --help  for printing out the instruction. 

This should look like:

Welcome to quick Geant4 setup.

./todo.pl --help                                             Prints this message

./todo.pl --version <N>                                      Unpack the corresponding version of file from Patrick;  

 


run ./todo.pl --version N. The most recent version is 8. 
then source the created Install_G4Env... file to setup the workdir,


in PhaseIIBeam_v*-build run:


./PhaseII proton.mac

or ./PhaseII  and in the command line 

/control/execute vis.mac 

/control/execute proton.mac

look in proton.root for plots
