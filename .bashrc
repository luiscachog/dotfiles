# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

#export PROMPT_COMMAND="${PROMPT_COMMAND};history -a; history -c; history -r;"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=400000
HISTCONTROL=ignoredups
HISTTIMEFORMAT='%F %T => '
HISTIGNORE="ls:cd:pwd:exit:date:* --help"


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

export EDITOR=vim

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi

# Add more .bash files
if [ -f ~/.bash_profile ]; then
	. ~/.bash_profile
fi

if [ -f ~/.bash_prompt ]; then
	. ~/.bash_prompt
fi

if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
	if [ -f ~/.git-prompt.sh ]; then
		. ~/.git-prompt.sh
	fi
fi

if [ -f ~/.hugo-completion.bash ]; then
    . ~/.hugo-completion.bash
fi

if [ -f ~/.buku-completion.bash ]; then
    . ~/.buku-completion.bash
fi
export BUKU_COLORS=eKlpm

if [ -f /usr/share/autojump/autojump.sh ]; then
    . /usr/share/autojump/autojump.sh
fi

if [ -f ~/.bash_rax ]; then
	. ~/.bash_rax
fi

if [ $TILIX_ID  ] || [ $VTE_VERSION  ]; then
    source /etc/profile.d/vte.sh
fi

if [ -x "$(command -v kubectl)"  ]; then
    source <(kubectl completion bash)
fi

if [ -x "$(command -v minikube)"  ]; then
    source <(minikube completion bash)
fi

export TERM=xterm-256color

# Bash correction
shopt -s autocd
shopt -s cdspell
shopt -s checkjobs
shopt -s hostcomplete
shopt -s nocaseglob

GOPATH=$HOME/workspace/go
PATH="$PATH:$HOME/bin:$HOME/.local/bin:/usr/lib/go-1.9/bin:$GOPATH/bin:$HOME/go/bin"


#powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh

#function _update_ps1() {
#    PS1="$(~/go/bin/powerline-go -colorize-hostname  -modules venv,user,host,ssh,cwd,perms,git,hg,jobs,exit,root,nix-shell,docker,node,termtitle,ssh,perms,nix-shell,gitlite  -cwd-mode fancy -cwd-max-dir-size -1 -cwd-max-depth 2 -numeric-exit-codes -error $?)"
#}

#if [ "$TERM" != "linux"  ]; then
#        PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#    fi



export ara_location=$(python -c "import os,ara; print(os.path.dirname(ara.__file__))")
export ANSIBLE_CALLBACK_PLUGINS=$ara_location/plugins/callbacks
export ANSIBLE_ACTION_PLUGINS=$ara_location/plugins/actions
export ANSIBLE_LIBRARY=$ara_location/plugins/modules
export ARA_DIR=/home/luis7238/.ara
export ARA_LOG_FILE=~/.ara/ara.log
export ARA_PLAYBOOK_PER_PAGE=15
export ARA_RESULT_PER_PAGE=30


#. "/home/luis7238/.acme.sh/acme.sh.env"
. "/home/luis7238/workspace/vault/letssl/acme.sh.env"

# Synchronise history
export PROMPT_COMMAND="${PROMPT_COMMAND};history -n; history -a; history -r;"

complete -C /home/luis7238/bin/packer packer
# added by Anaconda2 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/luis7238/.anaconda/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/luis7238/.anaconda/etc/profile.d/conda.sh" ]; then
        . "/home/luis7238/.anaconda/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/luis7238/.anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
alias ic="ibmcloud"
