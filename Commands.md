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

# Git install in terminal
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

# ZSH

```shell
apt-get install zsh
apt-get install git-core

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
																**OR**
```shell
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
