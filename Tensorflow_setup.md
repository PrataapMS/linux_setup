# Tensorflow installation

Check out [this](https://alliseesolutions.wordpress.com/2016/09/08/install-gpu-tensorflow-from-sources-w-ubuntu-16-04-and-cuda-8-0-rc/) for more detailed info.

Check out [this](https://www.tensorflow.org/get_started/os_setup) for official installation and setup documentation by tensorflow.org

## Install TensorFlow

You must pick the mechanism by which you install TensorFlow. The supported choices are as follows:

+ virtualenv
+ "native" pip
+ Docker
+ Anaconda

Create a virtual environment to work on, so that it is seperate from the main libraries

1. Install pip and virtualenv by issuing one of the following commands:
```bash
$ sudo apt-get install python-pip python-dev python-virtualenv # for Python 2.7
$ sudo apt-get install python3-pip python3-dev python-virtualenv # for Python 3.n
```

2. Create a virtualenv environment by issuing one of the following commands:
```bash
$ virtualenv --system-site-packages targetDirectory # for Python 2.7
$ virtualenv --system-site-packages -p python3 targetDirectory # for Python 3.n
```
where targetDirectory specifies the top of the virtualenv tree. Our instructions assume that targetDirectory is ~/tensorflow, but you may choose any directory.

3. Activate the virtualenv environment by issuing one of the following commands:
```bash
 $ source ~/tensorflow/bin/activate # bash, sh, ksh, or zsh
 $ source ~/tensorflow/bin/activate.csh  # csh or tcsh
```

4. Issue one of the following commands to install TensorFlow in the active virtualenv environment:

```bash
 (tensorflow)$ pip install --upgrade tensorflow      # for Python 2.7
 (tensorflow)$ pip3 install --upgrade tensorflow     # for Python 3.n
 (tensorflow)$ pip install --upgrade tensorflow-gpu  # for Python 2.7 and GPU
 (tensorflow)$ pip3 install --upgrade tensorflow-gpu # for Python 3.n and GPU
```

5. Actrivate the virtual environment
```bash
    source ~/tensorflow/bin/activate
```

## Installing with Anaconda

Take the following steps to install TensorFlow in an Anaconda environment:

Follow the instructions on the Anaconda download site to download and install Anaconda.

+ Create a conda environment named tensorflow to run a version of Python by invoking the following command:
```bash
$ conda create -n tensorflow
```
+ Activate the conda environment by issuing the following command:
```bash
 $ source activate tensorflow
 (tensorflow)$  # Your prompt should change 
```
+ Issue a command of the following format to install TensorFlow inside your conda environment:
```bash
 (tensorflow)$ pip install --ignore-installed --upgrade tfBinaryURL
```
where tfBinaryURL is the URL of the TensorFlow Python package. 

#### Python 2.7 url

CPU only:
```bash
https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.2.1-cp27-none-linux_x86_64.whl
```
GPU support:
```bash
https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.2.1-cp27-none-linux_x86_64.whl
```

For example, the following command installs the CPU-only version of TensorFlow for Python 2.7:
```bash
 (tensorflow)$ pip install --ignore-installed --upgrade \
 https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.2.1-cp34-cp34m-linux_x86_64.whl
```

## Install CUDA for GPU processing

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

## Download and install Cuda Toolkit
+ Download the .run file
+ Install version 8.0 	
+ Download the .run version of the toolkit. You need to grant permission to be able to execute .run file. Tp grant permission, Right click on the file in the file manager and click 'Properties'. Click the 'Permissions' tab and tick the box that says 'Allow executing file as program'. 	
Or enter 'chmod +x app-name.run' to grant permission from the terminal.


<https://developer.nvidia.com/cuda-downloads> 	
* Install the toolkit into e.g. /usr/local/cuda* 	

## Download and install cuDNN
Download cuDNN v5.1. 	
<https://developer.nvidia.com/cudnn>	

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

<http://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#runfile>

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
     + To go to text mode follow this:
     
       - while restaring ubuntu, before it boots up press left shift key.
       - On the ubuntu kernel options, select the right kernel to boot and press 'e' key
       - This opens the kernel options.
           + Find the line ending with quiet splash. Add your boot option before these key words - i.e. so the line looks like [...]nomodeset quiet splash 
           + Add 3 at the end of this line
        - Press CTRL + X to boot
        - Press 1 or F1 to go to text mode
        - Check if theres any driver running using "lsmod | grep nouveau"
     
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


## Run a short TensorFlow program to Test after activating the venv

Invoke python from your shell as follows:
```bash
$ python
```
Enter the following short program inside the python interactive shell:
```bash
# Python
import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
print(sess.run(hello))
```
If the system outputs the following, then you are ready to begin writing TensorFlow programs:
```bash
Hello, TensorFlow!
```

