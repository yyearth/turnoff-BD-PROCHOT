#!/bin/bash
#  

sudo modprobe msr 
# r=`sudo rdmsr 0x1FC`
# s='0x'$r'' 
# f=$(($s|0x00001))

# sudo wrmsr 0x1FC "obase=16;$f"|bc
sudo wrmsr 0x1FC 4005d

echo "BD PROCHOT on."
