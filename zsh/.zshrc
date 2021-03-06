# neofetch --ascii_distro redhat
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH="$HOME/go"
export PATH="/usr/local/opt/python/libexec/bin:/usr/local/sbin:/usr/local/bin:/usr/local/opt/ncurses/bin:/usr/local/opt/ruby/bin:$GOPATH/bin:$PATH"
export PATH="$HOME/bin/:$PATH"

# Path to my own config files.
export ZSH_CUSTOM="$HOME/.zshrc.d"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.zsh/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(you-should-use git colored-man-pages colorize pip python brew osx zsh-syntax-highlighting zsh-autosuggestions)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# To customize prompt, choose a theme config file:
[[ ! -f $ZSH_CUSTOM/themes/p10k.zsh ]] || source $ZSH_CUSTOM/themes/p10k.zsh

# load all config files from .zshrc.d/config directory
if [ -d $ZSH_CUSTOM/config ]; then
  for file in $ZSH_CUSTOM/config/*.zsh; do
    source $file
  done
fi

# load all aliases files from .zshrc.d/aliases directory
if [ -d $ZSH_CUSTOM/aliases ]; then
  for file in $ZSH_CUSTOM/aliases/*.zsh; do
    source $file
  done
fi

# load all plugins files from .zshrc.d/plugins directory
if [ -d $ZSH_CUSTOM/plugins ]; then
  for file in $ZSH_CUSTOM/plugins/*.zsh; do
    source $file
  done
fi

# load all completion files from .zshrc.d/plugins directory
if [ -d $ZSH_CUSTOM/completion ]; then
  for file in $ZSH_CUSTOM/completion/*; do
    source $file
  done
fi

if [ $TILIX_ID  ] || [ $VTE_VERSION  ]; then
    source /etc/profile.d/vte.sh
fi

if [ $commands[kubectl]  ]; then
    source <(kubectl completion zsh)
fi

if [ $commands[minikube] ]; then
    source <(minikube completion zsh)
fi

# To source virtualenvwrapper
[[ ! -f /usr/local/bin/virtualenvwrapper.sh ]] || source /usr/local/bin/virtualenvwrapper.sh


# Using pyenv
if command -v pyenv 1>/dev/null 2>&1 ; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  # export PATH=$(pyenv root)/bin:$PATH
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

# Using virtualenv via pyenv
if [ -d ~/.virtualenvs  ]; then
  export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
  export WORKON_HOME=$HOME/.virtualenvs
  pyenv virtualenvwrapper_lazy
fi


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"




#source $(dirname $(gem which colorls))/tab_complete.sh

#eval "$(rbenv init -)"

#export PATH="$HOME/.jenv/bin:$PATH"
#  eval "$(jenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

# Use modern completion system
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

export TERM="xterm-256color"
tmux-new() {
  if [[ -n $TMUX ]]; then
    tmux switch-client -t "$(TMUX= tmux -S "${TMUX%,*,*}" new-session -dP "$@")"
  else
    tmux new-session "$@"
  fi
}
