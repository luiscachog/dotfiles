##### Commands #####
alias ls='exa --group-directories-first --classify --grid --header'
alias l='exa --group-directories-first --classify'
alias la='exa -a --group-directories-first --classify --grid'
alias ll='exa -l --group-directories-first --classify'
alias lla='exa -la --group-directories-first --classify --grid'
alias lt='exa -T --group-directories-first --classify'
alias lta='exa -T --long --group-directories-first --classify'
alias ld='exa --group-directories-first --classify --header --long --list-dirs --group -d --accessed --modified --created --grid'
alias lda='exa -a --group-directories-first --classify --header --long --list-dirs --group -d --accessed --modified --created --grid'
alias lg='exa --long --git --header'
alias lga='exa --long --git --header -a -a'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
# http://zsh.sourceforge.net/Doc/Release/Options.html#index-RMSTARSILENT
setopt rmstarsilent
alias ln='ln -i'
alias mkdir='mkdir -p'
alias rd='rmdir'


alias c='clear'
alias h='history'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias jobs='jobs -l'
alias dmesg='dmesg -HL'

alias copys="tr -d '\n' | pbcopy"                          # Trim new lines and copy to clipboard
alias cleands="find . -type f -name '*.DS_Store' -ls -delete"  # Recursively delete `.DS_Store` file
alias pastebin='pastebinit -a k4ch0'





alias acme.sh=~/.acme.sh/acme.sh


alias h='function hdi(){ howdoi $* -c -n 5;  }; hdi'

##### Git #####
alias g='git'
alias glof2='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset " --abbrev-commit'
alias glof='git log --pretty=format:"%C(yellow)%h%Creset %s %Cred%an%Creset %Cgreen%ad" --max-count=30 --date=relative --abbrev-commit --reverse'
compdef _git glof=git-log
alias gloc='git log --left-right --graph --cherry-pick --oneline -n 30'
compdef _git gloc=git-log
alias glog='git log --oneline --decorate --color --graph -n 30'
compdef _git glof=git-log


# Func: Completion on SSH Hosts
bash_completion () {
    # SSH Host completion
    if [ -e ~/.ssh/known_hosts  ] ; then
        complete -W "$(echo `cat ~/.ssh/known_hosts | cut -Func 1 -d '  ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
        # Note: HashKnownHosts need to be set 'no' in /etc/ssh/ssh_config
    fi
}



