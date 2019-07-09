##### Commands #####

alias ll='ls -lh'
alias la='ls -lAh'
alias l='ls -ClFh'
alias ltr='ls -ahltr'
alias lsd="ls -l | grep ^d"

alias mkdir='mkdir -p'

alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ....='cd ../../../'                     # Go back 3 directory levels
alias .....='cd ../../../../'                  # Go back 4 directory levels
alias ......='cd ../../../../../'               # Go back 5 directory levels
alias .......='cd ../../../../../../'            # Go back 6 directory levels

alias h='history'
alias jobs='jobs -l'
alias g='git'


alias update='sudo aptitude update && sudo aptitude upgrade -y'
alias mountnas01='sudo mount -t nfs nas01:/mnt/HD/HD_a2/LuisCacho /mnt'
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias weather='curl -4 wttr.in'
alias pastebin='pastebinit -a k4ch0'
alias ordenatam='du -sBM * | sort -g'
alias lsalias='less ~/.bash_aliases'

alias myip='curl ifconfig.co'                           # myip:         Public facing IP Address
alias netCons='lsof -i'                                 # netCons:      Show all open TCP/IP sockets
alias lsock='sudo lsof -i -P'                     # lsock:        Display open sockets
alias lsockU='sudo lsof -nP | grep UDP'           # lsockU:       Display only open UDP sockets
alias lsockT='sudo lsof -nP | grep TCP'           # lsockT:       Display only open TCP sockets
alias openPorts='sudo lsof -i | grep LISTEN'            # openPorts:    All listening connections

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

alias acme.sh=~/.acme.sh/acme.sh

hgrep () {
    history | grep ${*:1}
}

##### SSH Connections #####

alias bastion='ssh bastion -D 9001 -X'
alias gerrit='ssh -l luiscachog -p 29418 review.openstack.org /home/luis7238/.ssh/luiscachog.io_rsa'
alias nas01='ssh -oHostKeyAlgorithms=+ssh-dss sshd@nas01 -i /home/luis7238/.ssh/luiscachog.io_rsa'
alias berry='ssh -aYX luis7238@berry.home.lab -i /home/luis7238/.ssh/luiscachog.io_rsa'
alias vesta='ssh luis7238@git.luiscachog.io -i /home/luis7238/.ssh/luiscachog.io_rsa'
alias k8s='ssh root@162.242.218.174 -i /home/luis7238/.ssh/luiscachog.io_rsa'
alias k8s-a='ssh root@104.239.174.34 -i /home/luis7238/.ssh/luiscachog.io_rsa'
alias k8s-b='ssh root@172.99.75.146 -i /home/luis7238/.ssh/luiscachog.io_rsa'

##### Functions #####

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
     esac
    else
      echo "'$1' is not a valid file"
    fi
}

sign1p (){
    export OP_SESSION_my=$(~/bin/op signin my --output=raw)
}

g1p () {
    op get item ${*:1} | jq '.details.fields[] | select(.designation=="password").value'
}

##########################
# Func: Completion on SSH Hosts
##########################

bash_completion () {
    # SSH Host completion
    if [ -e ~/.ssh/known_hosts  ] ; then
        complete -W "$(echo `cat ~/.ssh/known_hosts | cut -Func 1 -d '  ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
        # Note: HashKnownHosts need to be set 'no' in /etc/ssh/ssh_config
    fi
}


# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Gzip-enabled `curl`
alias gurl='curl --compressed'

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""


# Trim new lines and copy to clipboard
alias copys="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

#Docker
alias rmdockcont="docker ps -a | grep Exit | cut -d '  ' -f 1 | xargs sudo docker rm"
alias d="docker"

# Projects
alias project="cd ~/workspace/projects/$CURRENT_PROJECT"

# git stuff
alias startover='git status | grep "modified" | awk "{print \$2}" | xargs -I{} git checkout -- {}'

# tmux stuff
alias tmux="TERM=screen-256color-bce tmux"
alias tm="tmux new-session"
alias tl="tmux list-sessions"
alias ta="tmux attach -t"
