# Turn Off BD PROCHOT

>  “BD PROCHOT" stands for bi-directional prochot. PROCHOT stands for processor hot. This signal is what initiates thermal throttling so the CPU can slow down and keep from over heating. 

BD PROCHOT can cause CPU run at a very low frequency, on ThinkPad E440, which is only 800MHz(max 2.3GHz). The cause of the signal activation usually are aging power adapter, aging battery, or bad sensor on matherboard. Each of cause can activate BD PROCHOT. 

In order to restore the CPU back to full speed, can just clear the BD PROCHOT signal, on windows, use software **Throttle Stop** and uncheck the corresponding control.

The register address of BD PROCHOT signal bit on CPU is 0x1FC. The bit[0] is the signal sign. So on Linux, the solution is use `msr-tool` to write the bit[0] to 0. the step is following:

```shell
sudo apt install msr-tool
sudo modprobe msr
```

read the 0x1FC register: 

```shell
sudo rdmsr 0x1FC
```

clear the bit[0], the output bitwise and with 0xFFFFE. Write back the value:

```shell
sudo wrmsr 0x1FC value
```

Done. Check the CPU frequency :

```shell
lscpu | grep MHz
```



#### To auto turn off the BD PROCHOT on every boot:

Write the steps in a shell script. Give permission: 

```shell
chmod +x shellfile
```

Add the path of script to the last line of `rc.local`.

```shell
sudo vim /etc/rc.local
```

