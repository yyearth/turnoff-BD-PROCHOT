## Monitoring, Stress, Set & Test CPU 

#### Monitoring

` $ htop ` : realtime.

`$ i7z` : realtime freq.

`$ lscpu`

`$ lscpu | grep MHz `:  only show freq.

`$ cat /sys/devices/system/cpu/cpu*/cpufreq/<name>` :

​	`scaling_available_governors` `scaling_available_frequencies` `scaling_governor` `scaling_max_freq` `scaling_cur_freq` 

`$ cpufreq-info`

#### Stress

`$ stress --cpu 8 --io 4 --vm 4 --vm-bytes 1024M --timeout 10 ` : 8 cpu thread, 4 on sync(), 4 on malloc()/free(), malloc 1024MB for each vm, last 10s.

#### Set 

`$ cpufreq-set -r -f 2.0GHz` : all core freq set to 2.0GHz.

`$ cpufreq-set -r -g performance` : all core governors set to performance.

##### If an error occured like:

```shell
Error setting new values. Common errors:
- Do you have proper administration rights? (super-user?)
- Is the governor you requested available and modprobed?
- Trying to set an invalid policy?
- Trying to set a specific frequency, but userspace governor is not available,
for example because of hardware which cannot be set to a specific frequency
or because the userspace governor isn't loaded?
```

then check:

```shell
$ cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_driver
intel_pstate
...
$ cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
powersave
...
```

`sudo vim /etc/default/grub`

change the line:

`GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"` 

to 

`GRUB_CMDLINE_LINUX_DEFAULT="quiet splash intel_pstate=disable"` 

Run: 

`sudo update-grub`

`sudo init 6` : reboot. 

#### Test

`$ ./geekbench`

 