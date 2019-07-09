
source ~/.zsh/powerlevel9k.zsh

export TERM="xterm-256color"
tmux-new() {
  if [[ -n $TMUX ]]; then
    tmux switch-client -t "$(TMUX= tmux -S "${TMUX%,*,*}" new-session -dP "$@")"
  else
    tmux new-session "$@"
  fi
}

zsh_kubens(){
  echo -n "$(kube_ps1)"
  }

export CURRENT_PROJECT="luiscachog.io"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241" # gray highlight
ZSH_AUTOSUGGEST_STRATEGY="history"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=15

# Command auto-correction.
ENABLE_CORRECTION="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="yyyy-mm-dd"

# YSU
YSU_MESSAGE_POSITION="before"


# Exlude commands on history
HISTORY_IGNORE="(ls|cd|pwd|exit|date|* --help)"
# Keep 200000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=200000
SAVEHIST=400000
HISTFILE=~/.zsh_history

setopt histignorealldups sharehistory
setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Dont overwrite history
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.
setopt hist_ignore_space        # Ignore commands that start with space.

# Changing directories
# #setopt auto_pushd
# setopt pushd_ignore_dups        # Dont push copies of the same dir on stack.
# setopt pushd_minus              # Reference stack entries with "-".
#
# setopt extended_glob


##### PATH #####

path+=('~/bin/')
path+=('~/.node_global_modules/bin')

export PATH


##### Variables #####
export ANSIBLE_COW_SELECTION=tux
export ANSIBLE_NOCOWS=1


# Use modern completion system
autoload -Uz compinit && compinit
autoload -U bashcompinit && bashcompinit

export ANTIGEN_PLUGIN_UPDATE_DAYS=2
export ANTIGEN_SYSTEM_UPDATE_DAYS=2

##### Antigen Configuration #####
source ~/.antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle robbyrussell/oh-my-zsh lib/
antigen bundles <<EOBUNDLES 
    git
    heroku
    pip
    python
    virtualenv
    lein
    command-not-found
    zsh-users/zsh-completions
    zsh-users/zsh-autosuggestions
    autojump
    soimort/translate-shell
    compleat
    docker
    kubectl
    git-extras
    git-flow
    tmux
    tmuxinator
    colored-man-pages
    urltools
    golang
    rummik/zsh-tailf
    zlsun/solarized-man
    sparsick/ansible-zsh
    srijanshetty/zsh-pip-completion
    chrissicool/zsh-256color
    pbar1/zsh-terraform
    MichaelAquilina/zsh-you-should-use
    unixorn/autoupdate-antigen.zshplugin
    voronkovich/gitignore.plugin.zsh
    vi-mode
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
EOBUNDLES


#    popstas/zsh-command-time

# Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zdharma/fast-syntax-highlighting

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k
# antigen theme denysdovhan/spaceship-prompt
# https://github.com/denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply


# If command execution time above min. time, plugins will not output time.
#ZSH_COMMAND_TIME_MIN_SECONDS=3

# Message to display (set to "" for disable).
#ZSH_COMMAND_TIME_MSG="Execution time: %s sec"

# Message color.
#ZSH_COMMAND_TIME_COLOR="cyan"

# zsh_command_time() {
#    if [ -n "$ZSH_COMMAND_TIME" ]; then
#        hours=$(($ZSH_COMMAND_TIME/3600))
#        min=$(($ZSH_COMMAND_TIME/60))
#        sec=$(($ZSH_COMMAND_TIME%60))
#        if [ "$ZSH_COMMAND_TIME" -le 60 ]; then
#            timer_show="$fg[green]$ZSH_COMMAND_TIME s."
#        elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
#            timer_show="$fg[yellow]$min min. $sec s."
#        else
#            if [ "$hours" -gt 0 ]; then
#                min=$(($min%60))
#                timer_show="$fg[red]$hours h. $min min. $sec s."
#            else
#                timer_show="$fg[red]$min min. $sec s."
#            fi
#        fi
#        printf "${ZSH_COMMAND_TIME_MSG}\n" "$timer_show"
#    fi
# }




##### Sourcing aditional files #####
if [ -f ~/.zsh/aliases/zsh_aliases  ]; then
    source ~/.zsh/aliases/zsh_aliases
else
    print "404: ~/.zsh/aliases/zsh_aliases not found."
fi

if [ -f ~/.zsh/aliases/rax_aliases ];then
    source ~/.zsh/aliases/rax_aliases
else
    print "404: ~/.zsh/aliases/rax_aliases not found."
fi

if [ $TILIX_ID  ] || [ $VTE_VERSION  ]; then
    source /etc/profile.d/vte.sh
fi

#if [ $commands[/usr/bin/kubectl]  ]; then
source <(kubectl completion zsh)
#fi

if [ $commands[minikube] ]; then
    source <(minikube completion zsh)
fi

##### Functions ##### 
#man() {
#    env \
#    LESS_TERMCAP_mb=$(printf "\e[1;31m")  \
#    LESS_TERMCAP_md=$(printf "\e[1;31m") \
#    LESS_TERMCAP_me=LESS_TERMCAP_me$(printf "\e[0m") \
#    LESS_TERMCAP_se=$(printf "\e[0m") \
#    LESS_TERMCAP_seESS_TERMCAP_so=$(printf "\e[1;44;33m") \
#    LESS_TERMCAP_ue=$(printf "\e[0m") \
#    LESS_TERMCAP_us=$(printf "\e[1;36m") \
#    man "$@"
#}

# =============================================================================
#                                Key Bindings
# =============================================================================

# Common CTRL bindings.
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^k" kill-line
bindkey "^d" delete-char
bindkey "^y" accept-and-hold
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^F" history-incremental-pattern-search-forward

# Do not require a space when attempting to tab-complete.
bindkey "^i" expand-or-complete-prefix

# Fixes for alt-backspace and arrows keys
bindkey '^[^?' backward-kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
#bindkey "^[[C" forward-word
#bindkey "^[[D" backward-word

## Emulate tcsh's backward-delete-word
#tcsh-backward-kill-word () {
#    local WORDCHARS="${WORDCHARS:s#/#}"
#    zle backward-kill-word
#}
#zle -N tcsh-backward-kill-word

# https://github.com/sickill/dotfiles/blob/master/.zsh.d/key-bindings.zsh
tcsh-backward-word () {
  local WORDCHARS="${WORDCHARS:s#./#}"
  zle emacs-backward-word
}
zle -N tcsh-backward-word
bindkey '\e[1;3D' tcsh-backward-word
bindkey '\e^[[D' tcsh-backward-word # tmux

tcsh-forward-word () {
  local WORDCHARS="${WORDCHARS:s#./#}"
  zle emacs-forward-word
}
zle -N tcsh-forward-word
bindkey '\e[1;3C' tcsh-forward-word
bindkey '\e^[[C' tcsh-backward-word # tmux

tcsh-backward-delete-word () {
  local WORDCHARS="${WORDCHARS:s#./#}"
  zle backward-delete-word
}
zle -N tcsh-backward-delete-word
bindkey "^[^?" tcsh-backward-delete-word # urxvt

# =============================================================================
#                                 Completions
# =============================================================================

zstyle ':completion:*' rehash true
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*' group-name ''

# case-insensitive (all), partial-word and then substring completion
zstyle ":completion:*" matcher-list \
  "m:{a-zA-Z}={A-Za-z}" \
  "r:|[._-]=* r:|=*" \
  "l:|=* r:|=*"

zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}

## Scripts ##
#python3 ~/bin/ranwhen/ranwhen.py
. "/home/luis7238/.acme.sh/acme.sh.env"

#export PATH="/home/luis7238/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

if [ -d ~/.pyenv  ]; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  export PATH=$(pyenv root)/bin:$PATH
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi


if [ -d ~/.virtualenvs  ]; then
  export WORKON_HOME=$HOME/.virtualenvs
  source /home/luis7238/.pyenv/versions/2.7.12/bin/virtualenvwrapper.sh
fi

export PATH="/home/luis7238/.minishift/cache/oc/v3.11.0/linux:$PATH"
#eval $(minishift oc-env)
source <(oc completion zsh)

if [ -f ~/.minishift-completion ];then
    source ~/.minishift-completion
fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/luis7238/bin/packer packer

unset VIRTUAL_ENV_DISABLE_PROMPT

#for config (~/.zsh/*.zsh) source $config
for config (~/.zsh/*/*.zsh) source $config


