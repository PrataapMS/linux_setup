# Redhsift installation:
```shell
sudo apt-get gtk-redshift
gtk-redshift -l 2.97:77.59
```

#### Crontab Setup

*Not necessary to setup crontab, use incase auto start option is not available*

**To see the list with the programs you can type**
```shell
crontab -l
```

**To edit the list type**
```shell
crontab -e
```

**Add this line in the end, to boot redshift whenever computer starts up**
```shell
@reboot export DISPLAY=:0.0 && /usr/bin/redshift -l 2.97:77.59
```

*Access help for redshift using:*
```shell
redshift -h
```

# Install Git in terminal
```shell
sudo apt-get update
sudo apt-get install git

# Enter username and email:
git config --global user.name "Your Name"
git config --global user.email "youremail@domain.com"

# To check config items
git config --list

# Edit config:
nano ~/.gitconfig

# To enable password caching so that you need not have to re-enter pwd everytime you git push
git config --global credential.helper "cache --timeout=3600"

```

# Install ZSH shell

```shell
apt-get install zsh
apt-get install git-core
```
Then download and install oh-my-zsh for customization using:
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
			**OR**
```shell
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
Use source to enable zsh or change shell using:
```shell
chsh -s `which zsh`
```
[Official Github repo](https://github.com/robbyrussell/oh-my-zsh)
Find all themes [here](https://github.com/robbyrussell/oh-my-zsh/wiki/External-themes)
*Restart if required.*

First Header | Second Header
------------ | -------------
Content cell 1 | Content cell 2
Content column 1 | Content column 2