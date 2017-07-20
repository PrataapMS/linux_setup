# Tensorflow installation

Check out [this](https://alliseesolutions.wordpress.com/2016/09/08/install-gpu-tensorflow-from-sources-w-ubuntu-16-04-and-cuda-8-0-rc/) for more detailed info.

Check out [this](https://www.tensorflow.org/get_started/os_setup) for official installation and setup documentation by tensorflow.org

CUDA® Toolkit 8.0. For details, see [NVIDIA's documentation](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#axzz4VZnqTJ2A). Ensure that you append the relevant Cuda pathnames to the LD_LIBRARY_PATH environment variable as described in the NVIDIA documentation. 	
Continue and follow steps below if you do not check NVidia's documentation mentioned above. 	

2.1. Verify You Have a CUDA-Capable GPU
```shell
$ lspci | grep -i nvidia
```

2.2. Verify You Have a Supported Version of Linux
```shell
$ uname -m && cat /etc/*release
```

2.3. Verify the System Has gcc Installed
```shell
$ gcc --version
```

**If you have Nvidia GPU with CUDA 3.0, install GPU related setup for processing in thr GPU for much faster computation compared to CPU processing.** 	 

### Download and install Cuda Toolkit
Download the .run file
Install version 8.0 	
Download the .run version of the toolkit. You need to grant permission to be able to execute .run file. Tp grant permission, Right click on the file in the file manager and click 'Properties'. Click the 'Permissions' tab and tick the box that says 'Allow executing file as program'. 	
Or enter 'chmod +x app-name.run' to grant permission from the terminal.


https://developer.nvidia.com/cuda-downloads 	
*Install the toolkit into e.g. /usr/local/cuda* 	

### Download and install cuDNN
Download cuDNN v5.1. 	
https://developer.nvidia.com/cudnn	

Uncompress and copy the cuDNN files into the toolkit directory. Assuming the toolkit is installed in /usr/local/cuda, run the following commands (edited to reflect the cuDNN version you downloaded):	
```shell
tar xvzf cudnn-8.0-linux-x64-v5.1-ga.tgz
sudo cp -P cuda/include/cudnn.h /usr/local/cuda/include
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
```

```shell
Use the following command to uninstall a Toolkit runfile installation:
$ sudo /usr/local/cuda-X.Y/bin/uninstall_cuda_X.Y.pl
---------------------------------------------------------------------
Use the following command to uninstall a Driver runfile installation:
$ sudo /usr/bin/nvidia-uninstall
---------------------------------------------------------------------
Use the following commands to uninstall a RPM/Deb installation:
sudo apt-get --purge remove <package_name>          # Ubuntu
Example:
    apt-cache search nvidia | grep -P '^nvidia-[0-9]+\s'
    sudo apt-get --purge remove nvidia-375
```

###  Package Manager Installation

http://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#runfile

4.3. Disabling Nouveau
To install the Display Driver, the Nouveau drivers must first be disabled. Each distribution of Linux has a different method for disabling Nouveau.

The Nouveau drivers are loaded if the following command prints anything:
$ lsmod | grep nouveau

4.3.5. Ubuntu
Create a file at /etc/modprobe.d/blacklist-nouveau.conf with the following contents:
blacklist nouveau
options nouveau modeset=0
Regenerate the kernel initramfs:
$ sudo update-initramfs -u

#### Runfile Installation

 - Perform the pre-installation actions.

 - Disable the Nouveau drivers.

 - Reboot into text mode (runlevel 3).  
    This can usually be accomplished by adding the number "3" to the end of the system's kernel boot parameters.

    Since the NVIDIA drivers are not yet installed, the text terminals may not display correctly. Temporarily adding "nomodeset" to the system's kernel boot parameters may fix this issue.

    Consult your system's bootloader documentation for information on how to make the above boot parameter changes.

    The reboot is required to completely unload the Nouveau drivers and prevent the graphical interface from loading. The CUDA driver cannot be installed while the Nouveau drivers are loaded or while the graphical interface is active.

 - Verify that the Nouveau drivers are not loaded. If the Nouveau drivers are  still loaded, consult your distribution's documentation to see if further steps are needed to disable Nouveau.

 - Run the installer and follow the on-screen prompts:

```shell
    $ sudo sh cuda_<version>_linux.run
```

 - Reboot the system to reload the graphical interface
 
 - Verify the device nodes are created properly.

 - Perform the post-installation actions.





