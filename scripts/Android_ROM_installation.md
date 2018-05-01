# Install ROM on Android 
#### Refer while flashing rom to any Andriod device.

### Backup all storage and sd card data
### Using ADB Command
- [How to Install ADB and Fastboot on your Computer](http://www.droidape.com/a-brief-introduction-to-adb-and-fastboot-on-android/)

- [How to Install USB Drivers for OnePlus One](http://www.droidape.com/the-ultimate-guide-to-download-and-install-android-usb-drivers/)

- [Upgrading LineageOS](https://wiki.lineageos.org/upgrading.html)

- [Download Android SDK](https://developer.android.com/studio/index.html?hl=sk#tos-header) to get all the necessary tools to access Android debugging shell to use commands


### List files using these commands:
```shell
adb shell ls -R /
```

- You probably need the root permission though.

> Edit: use ls with grep like this:

```shell
adb shell ls -Ral yourDirectory | grep -i yourString
# -i is for ignore-case. and / is the root directory.
```

- Copy from Android to PC
```shell
adb pull /sdcard/WhatsApp/Media C:\Users\HomeMaster\Desktop\OneplusOne\WhatsApp\
```

- Copy from PC to Android
```shell
adb push C:\Users\HomeMaster\Desktop\video.mp4 /sdcard/
```

### Install Recovery
- Install via ADB
- Connect your Android device to the PC. Type the following into the command window to boot your device into bootloader/fastboot mode:
```shell
adb reboot bootloader
```

- Once your device boots into bootloader mode, type this into the command line.
```shell
fastboot flash recovery C:\Android\CustomRom\Recovery\TWRP_3.1.1-5-TugaPower.img
```
- Once TWRP is successfully flashed on your device, type this final command to reboot your device.

```shell
fastboot reboot
```

### Download a ROM of your choice

- Download ROM zip and move the ROM zip to /sdcard in phone using adb or copy from file explorer.
- [LineageOS](https://download.lineageos.org/) is a good choice. There are several ROMs that are good and changes according to the Android version to want to install.

### Download supported GApps micro/nano.
- Download gApps and move to /sdcard in phone using adb or file explorer.

### Install the ROM and gApps.
- Go to the recovery mode in your phone.

- If custom recovery is not installed, install TWRP Recovery to access a custom recovery with several options such as install, format, file explorer etc.

- If you want to clean install the ROM, wipe and format the phone completly using options in the recovery. Backup the phone if you don't want to lose any data in case the installation fails for any reason.

- If you want to upgrade, just install the ROM from recovery without formatting/resetting the phone.

- Go to Install -> location of rom/package -> install rom and package.
