## My bash shell setup:
####Old:
**Use only for reference**
```shell

fortune | cowsay -f apt

ls

#source ~/dotfiles/zsh-config/ssh.zsh

# reboot, hibernate and shutdown
alias brb='cowsay "i will be waiting buddy" && sudo pm-suspend'
alias bye='cowsay "Bye bye buddy" && sudo poweroff'
alias re='cowsay "we will meet soon" && sudo reboot'

# system commands
alias v="vim"
alias vi="vim"
alias vsplit="vim -O"
alias x='exit'
alias m='cmatrix -s'
alias tmux="TERM=screen-256color-bce tmux -u"
alias s="subl"

#application shortcuts
alias chrome="google-chrome"
alias music="rhythmbox"
alias r="rstudio"
alias mongo="mongod && robomongo"
alias pocket="/opt/google/chrome/google-chrome --profile-directory=Default --app-id=mjcnijlhddpbdemagnpefmlkjdagkogk"
alias wf="/opt/google/chrome/google-chrome --profile-directory=Default --app-id=koegeopamaoljbmhnfjbclbocehhgmkm"
alias pomo="/opt/google/chrome/google-chrome --profile-directory=Default --app-id=cghomilbbfdmgfidkdinillpmdpdjgmm"
# show progress bar while cp mv
alias cp='cp -gR'
alias mv='mv -gi'
alias rm='rm -R'

# debian commands
alias ag='apt-get'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias search='sudo apt-cache search'
alias update='sudo apt-get update'
alias autoremove='sudo apt-get autoremove'
alias purge='sudo apt-get purge'


#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

```