## New zsh config
```shell
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
  export ZSH=/home/prataap/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
 ZSH_THEME="robbyrussell" #default

#ZSH_THEME="agnoster"
#ZSH_THEME="kafeitu"
#ZSH_THEME="amuse"
#ZSH_THEME="mira"
#ZSH_THEME="obraun"
#ZSH_THEME="nanotech"
#ZSH_THEME="bira"
#ZSH_THEME="sorin"
#ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"


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
alias op="xdg-open"

#application shortcuts
alias chrome="google-chrome"
alias music="rhythmbox"
alias r="rstudio"
alias mongo="mongod && robomongo"
alias pocket="/opt/google/chrome/google-chrome --profile-directory=Default --app-id=mjcnijlhddpbdemagnpefmlkjdagkogk"
alias wf="/opt/google/chrome/google-chrome --profile-directory=Default --app-id=koegeopamaoljbmhnfjbclbocehhgmkm"
alias pomo="/opt/google/chrome/google-chrome --profile-directory=Default --app-id=cghomilbbfdmgfidkdinillpmdpdjgmm"
# show progress bar while cp mv
# alias cp='cp -gR'
# alias mv='mv -gi'
# alias rm='rm -R'

# debian commands
alias ag='apt-get'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias search='sudo apt-cache search'
alias update='sudo apt-get update'
alias autoremove='sudo apt-get autoremove'
alias purge='sudo apt-get purge'
alias python='ipython'

# tensorflow setup nvidia exports

export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export CUDA_HOME=/usr/local/cuda-8.0

# added by Anaconda2 4.4.0 installer
export PATH="/home/prataap/softwares/anaconda2/bin:$PATH"
```