#!/bin/bash
#System defined variables created and maintained by the OS and user can view this variables using env or printenv command
#Most of the time, they are in uppercase. They can be view with the help of env or printenv command 

#$USER and $LOGNAME --> Display the username which is current logged in
echo $USER
echo $LOGNAME

#$UID --> Displays the UID number of the user currently logged in 
echo $UID

#$HOME --> Home directory of the current logged in user
#$PWD --> Print working directory
echo $HOME
echo $PWD

#$BASH and BASH_VERSION --> If the shell is bash, displays the shell name and its version 
echo $BASH
echo $BASH_VERSION

#$0 and $SHELL --> Shell type 
echo $0
echo $SHELL

#$HOSTNAME --> Hostname of the machine
echo $HOSTNAME
#$HOSTTYPE --> Whether the machine is 64 or 32 bit. 
echo $HOSTTYPE

#$RANDOM --> generate a random number
echo $RANDOM
echo $LANG

#HISTZIE --> Display the number of commands stored in the memory for the current session
#HISTFILE --> Location of the history file
$HISTFILEZIE --> Number of commands stored inside the history file 
echo $HISTSIZE
echo $HISTFILE
echo $HISTFILESIZE
