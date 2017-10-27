Mount or unmount your drives. 
===

mount.sh 
----
```bash

mkdir -p /media/foxtech/AudioData/
mkdir -p /media/foxtech/Games/
mkdir -p /media/foxtech/Shared/
mkdir -p /media/foxtech/Video/
mkdir -p /media/foxtech/Data/
mkdir -p /media/foxtech/Misc/

sudo mount -o ro /dev/sda1 /media/foxtech/AudioData/
sudo mount -o ro /dev/sda2 /media/foxtech/Games/
sudo mount -o ro /dev/sda5 /media/foxtech/Shared/
sudo mount -o ro /dev/sda6 /media/foxtech/Video/
sudo mount -o ro /dev/sda7 /media/foxtech/Data/
sudo mount -o ro /dev/sda8 /media/foxtech/Misc/
```
-----------------------------------------------------
unmount.sh 
----
```bash
sudo umount /media/foxtech/AudioData/
sudo umount /media/foxtech/Games/
sudo umount /media/foxtech/Shared/
sudo umount /media/foxtech/Video/
sudo umount /media/foxtech/Data/
sudo umount /media/foxtech/Misc/
```