#!/bin/bash
# 4005d --> 4005e

sudo modprobe msr
# sudo touch temp
r=`sudo rdmsr 0x1FC`
#echo $r > temp
s='0x'$r'' 
f=$(($s&0xFFFFE))
sudo wrmsr 0x1FC "obase=16;$f"|bc
echo "$r"" write to ""reg 0x1FC" 
echo "BD PROCHOT off."
