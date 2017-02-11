# Tensorflow installation

Check out [this](https://alliseesolutions.wordpress.com/2016/09/08/install-gpu-tensorflow-from-sources-w-ubuntu-16-04-and-cuda-8-0-rc/) for more detailed info.

Check out [this](https://www.tensorflow.org/get_started/os_setup) for official installation and setup documentation by tensorflow.org

**If you have Nvidia GPU with CUDA 3.0, install GPU related setup for processing in thr GPU for much faster computation compared to CPU processing.** 	 

#### Download and install Cuda Toolkit
Install version 8.0 	
Download the .run version of the toolkit. You need to grant permission to be able to execute .run file. Tp grant permission, Right click on the file in the file manager and click 'Properties'. Click the 'Permissions' tab and tick the box that says 'Allow executing file as program'. 	
Or enter 'chmod +x app-name.run' to grant permission from the terminal.


https://developer.nvidia.com/cuda-downloads 	
**Install the toolkit into e.g. /usr/local/cuda**	

#### Download and install cuDNN
Download cuDNN v5.1. 	
https://developer.nvidia.com/cudnn	

Uncompress and copy the cuDNN files into the toolkit directory. Assuming the toolkit is installed in /usr/local/cuda, run the following commands (edited to reflect the cuDNN version you downloaded):	
```shell
tar xvzf cudnn-8.0-linux-x64-v5.1-ga.tgz
sudo cp -P cuda/include/cudnn.h /usr/local/cuda/include
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
```