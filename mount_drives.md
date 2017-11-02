Mount or unmount your drives. 
===
**Shutdown windows using this command in cmd to automatically enable Linux to mount other drives. Use the below script incase you dont do this.**
> shutdown.exe /s /t 00
**Use this script incase you aren'e able to mount the disk using the GUI in file manager**
***This script is also useful to force mount when windows didn't showdown and goes to hibernation mode. It can mount other partitions except the WinOS partition of the disk.***

> There are two shell scripts.
	1. Mount.sh -> creates a directory in media, then mounts the disk as read-only. Then it remounts as read-write.
	2. Unmount.sh -> unmounts the drive

mount.sh 
----
```bash

sudo mkdir -p /media/user/data/

sudo mount -o ro /dev/sda1 /media/user/data/

sudo mount -o remount,rw /dev/sda1 /media/user/data/

```
-----------------------------------------------------
unmount.sh 
----
```bash

sudo umount /media/user/data/

```
