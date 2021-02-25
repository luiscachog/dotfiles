##### SSH Connections #####
alias bastion='ssh bastion -D 9001 -X'
alias gerrit='ssh -l luiscachog -p 29418 review.openstack.org /home/luis7238/.ssh/luiscachog.io_rsa'
alias nas01='ssh -oHostKeyAlgorithms=+ssh-dss sshd@nas01.home.lab -i /home/luis7238/.ssh/luiscachog.io_rsa'
alias berry='ssh -aYX luis7238@berry.home.lab -i /home/luis7238/.ssh/luiscachog.io_rsa'

##### Files
alias aedit="$EDITOR $ZSH_CUSTOM/aliases/aliases.zsh; source $ZSH_CUSTOM/aliases/aliases.zsh"
alias fedit="$EDITOR $ZSH_CUSTOM/functions.zsh; source $ZSH_CUSTOM/functions.zsh"
alias pedit="$EDITOR $ZSH_CUSTOM/private.zsh; source $ZSH_CUSTOM/private.zsh"
alias viedit="$EDITOR $HOME/.vimrc"

alias preview="fzf --height 40% --layout reverse --info inline --border --preview 'cat {}' --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'"

##### Commands #####
alias reload!='source ~/.zshrc'
#alias ls='exa'
alias ll='ls -lFh'
alias la='ls -lAFh'
alias l='ls -ClFh'
alias ltr='ls -altrFh'
alias lsd="ls -lFh | grep --color=never ^d"

alias mkdir='mkdir -p'

alias ~="cd ~"                                             # `cd` is probably faster to type though
alias -- -="cd -"
alias cd..='cd ../'                                        # Go back 1 directory level (for fast typers)
alias ..='cd ../'                                          # Go back 1 directory level
alias ...='cd ../../'                                      # Go back 2 directory levels
alias .3='cd ../../../'                                    # Go back 3 directory levels
alias .4='cd ../../../../'                                 # Go back 4 directory levels
alias .5='cd ../../../../../'                              # Go back 5 directory levels
alias .6='cd ../../../../../../'                           # Go back 6 directory levels
alias ....='cd ../../../'                                  # Go back 3 directory levels
alias .....='cd ../../../../'                              # Go back 4 directory levels
alias ......='cd ../../../../../'                          # Go back 5 directory levels
alias .......='cd ../../../../../../'                      # Go back 6 directory levels

alias c='clear'
alias h='history'
alias clear='[ $[$RANDOM % 10] = 0 ] && timeout 5 cmatrix -Ba -u 2; clear || clear'
alias cp='cp -i'
alias dmesg='dmesg -HL'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias jobs='jobs -l'
alias ln='ln -i'
alias mkdir='mkdir -p'
alias mv='mv -i'
alias rd='rmdir'
alias lsalias='less ~/.zsh_aliases'
alias psa='ps ax |grep '
alias pem="openssl x509 -noout -text -in "
alias b="buku"
complete -cf {sudo,man,which}

# http://zsh.sourceforge.net/Doc/Release/Options.html#index-RMSTARSILENT
setopt rmstarsilent

alias uupdate='sudo aptitude update && sudo aptitude upgrade -y'
alias mountnas01='sudo mount -t nfs nas01:/mnt/HD/HD_a2/LuisCacho /mnt'
alias weather='curl -s "wttr.in/{San Antonio,CDMX,Santo Domingo Zanatepec }?m&format=v2"'
alias week='date +%V'                                      # Get week number
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'  # Stopwatch
alias copys="tr -d '\n' | pbcopy"                          # Trim new lines and copy to clipboard
alias cleands="find . -type f -name '*.DS_Store' -ls -delete"  # Recursively delete `.DS_Store` file
alias pastebin='pastebinit -a k4ch0'
alias sizeFiles='du -sBM * | sort -g'
alias duh='du -hc --max-depth=1'
alias numFiles='echo $(ls -1 | wc -l)'                     # numFiles:     Count of non-hidden files in current dir

alias myip='curl ifconfig.co'                              # myip:         Public facing IP Address
alias netCons='lsof -i'                                    # netCons:      Show all open TCP/IP sockets
alias lsock='sudo lsof -i -P'                              # lsock:        Display open sockets
alias lsockU='sudo lsof -nP | grep UDP'                    # lsockU:       Display only open UDP sockets
alias lsockT='sudo lsof -nP | grep TCP'                    # lsockT:       Display only open TCP sockets
alias openPorts='sudo lsof -i | grep LISTEN'               # openPorts:    All listening connections

alias qfind="find . -name "                                # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }                     # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }                 # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }                 # ffe:      Find file whose name ends with a given string

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

##### Docker #####

alias dps='docker ps'
alias dpsl='docker ps -l $*'
alias drm='docker rm'
alias dexec='docker exec'
alias dlog='docker logs'
alias dip='docker inspect --format "{{ .NetworkSettings.IPAddress  }}" $*'
alias dstop_all='docker stop $* $(docker ps -q -f "status=running")'
alias drm_stopped='docker rm $* $(docker ps -q -f "status=exited")'
alias drmv_stopped='docker rm -v $* $(docker ps -q -f "status=exited")'
alias drm_all='docker rm $* $(docker ps -a -q)'
alias drmv_all='docker rm -v $* $(docker ps -a -q)'

#### Docker Images #####

alias di='docker images'
alias drmi='docker rmi'
alias dbu='docker build'
alias drmi_all='docker rmi $* $(docker images -a -q)'
alias drmi_dang='docker rmi $* $(docker images -q -f "dangling=true")'

##### Docker Volumes #####
alias dvls='docker volume ls $*'
alias dvrm_all='docker volume rm $(docker volume ls -q)'
alias dvrm_dang='docker volume rm $(docker volume ls -q -f "dangling=true")'


##### Kubectl #####
# Contexts
alias kcc='kubectl config get-contexts'
alias kctx='kubectx'

# Core
alias k='kubectl'
alias kc='kubectl'
alias kube='kubectl'
alias kd='kubectl delete'
alias kds='kubectl describe service'
alias ke='kubectl edit'
alias kg='kubectl get'
alias kga='kubectl get --all-namespaces'
alias kl='kubectl logs'
alias kcl='kubectl logs'
alias klf='kubectl logs -f'
alias kra='krender; kapply'

# certificatesigningrequests
alias kgcsr='kubectl get certificatesigningrequests'

# clusterrolebindings
alias kgcrb='kubectl get clusterrolebindings'

# clusterroles
alias kgcr='kubectl get clusterroles'

# componentstatuses
alias kgcs='kubectl get componentstatus'

# configmaps
alias kdscm='kubectl describe configmaps'
alias kecm='kubectl edit configmaps'
alias kgcm='kubectl get configmaps'
alias kgcmy='kubectl get configmaps -o wide'
alias kgacm='get_cluster_resources configmaps'

# controllerrevisions
alias kgcrv='kubectl get controllerrevisions'

# Cronjobs
alias kdsc='kubectl describe cronjobs'
alias kec='kubectl edit cronjobs'
alias kgc='kubectl get cronjobs'
alias kgcy='kubectl get cronjobs -o yaml'
alias kgac='get_cluster_resources cronjobs'

# customresourcedefinition
alias kgcrd='kubectl get customresourcedefinition'

# daemonsets
alias kdsds='kubectl describe daemonsets'
alias keds='kubectl edit daemonsets'
alias kgds='kubectl get daemonsets'
alias kgdsy='kubectl get daemonsets -o yaml'
alias kgads='get_cluster_resources daemonsets'

# Deployments
alias kdd='kubectl delete deployment'
alias kdsd='kubectl describe deployments'
alias ked='kubectl edit deployments'
alias kgd='kubectl get deployments'
alias kgdy='kubectl get deployments -o yaml'

# endpoints
alias kgep='kubectl get endpoints'

# events
alias kgev='kubectl get events'

# from file
alias kaf='kubectl apply -f'
alias kcf='kubectl create -f'
alias kdf='kubectl delete -f'
alias kef='kubectl edit -f'
alias kdsf='kubectl describe -f'
alias kgf='kubectl get -f'

# horizontalpodautoscalers
alias kghpa='kubectl get horizontalpodautoscalers'

# Ingress
alias kdi='kubectl delete ingress'
alias kgi='kubectl get ingress'
alias kei='kubectl edit ingress'
alias kgiy='kubectl get ingress -o yaml'
alias kdsi='kubectl describe ingress'
alias kgai='get_cluster_resources ingress'

# Jobs
alias kdj='kubectl delete job'
alias kdsj='kubectl describe jobs'
alias kej='kubectl edit jobs'
alias kgj='kubectl get jobs'
alias kgjy='kubectl get jobs -o yaml'
alias kgaj='get_cluster_resources jobs'

# limitranges
alias kglr='kubectl get limitranges'

# Namespaces
alias kdns='kubectl delete namespaces'
alias kdsns='kubectl describe namespaces'
alias kens='kubectl edit namespaces'
alias kgns='kubectl get namespaces'
alias kgnsy='kubectl get namespaces -o yaml'
alias kns='kubens'

# networkpolicies
alias kgnp='kubectl get networkpolicies'

# Nodes
alias kdsn='kubectl describe nodes'
alias ken='kubectl edit nodes'
alias kgn='kubectl get nodes'
alias kgny='kubectl get nodes -o yaml'
alias ktn='kubectl top nodes'

# persistentvolumeclaims
alias kgpvc='kubectl get persistentvolumeclaims'

# persistentvolumes
alias kgpv='kubectl get persistentvolumes'

# poddisruptionbudgets
alias kgpdb='kubectl get poddisruptionbudgets'

# podpreset
alias kgpp='kubectl get podpreset'

# Pods
alias kdp='kubectl delete pod'
alias kdsp='kubectl describe pods'
alias kep='kubectl edit pods'
alias kgap='get_cluster_resources pods'
alias kgp='kubectl get pods'
alias kgpy='kubectl get pods -o yaml'
alias ktp='kubectl top pods'

# podsecuritypolicies
alias kpsp='kubectl get podsecuritypolicies'

# podtemplates
alias kpt='kubectl get podtemplates'

# replicasets
alias krs='kubectl get replicasets'

# replicationcontrollers
alias kgrc='kubectl get replicationcontrollers'

# resourcequotas
alias kgrq='kubectl get resourcequotas'

# rolebindings
alias kgrb='kubectl get rolebindings'

# roles
alias kgr='kubectl get roles'

# secrets
alias kgs='kubectl get secrets'

# serviceaccounts
alias kgsa='kubectl get serviceaccounts'

# Services
alias kdss='kubectl describe services'
alias kes='kubectl edit services'
alias kgas='get_cluster_resources services'
alias kgs='kubectl get services'
alias kgsy='kubectl get services -o yaml'

# statefulsets
alias kgss='kubectl get statefulsets'

##### Exercism #####
alias exc='exercism'
alias exconfkey='exercism configure -k'
alias exconfdir='exercism configure -d'
alias exconfhost='exercism configure -u'
alias exconfapi='exercism configure -a'
alias helpexconf='exercism configure --help'
alias excsbm='exercism submit'
alias excftc='exercism fetch'

##### Functions #####
hgrep () {
    history | grep ${*:1}
}

# extract:  Extract most know archives with one command
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

# Execute a command in a specified pod, default drops user into the shell
kcexec () {
    kubectl exec -it $1 ${2:-bash}
}
kexec () {
    kubectl exec -it $1 ${2:-bash}
}

# Set and use a new context
knc () {
    kc config set-context $1
    kc config use-context $1
}

# Get all resources (e.g. pod) in all namespaces
get_cluster_resources () {
    kubectl get $1 -o wide --all-namespaces ${@:2}
}

function oslogin(){
    oc login $OPENSHIFT_URL -u $OPENSHIFT_USER -p $OPENSHIFT_PASS --insecure-skip-tls-verify
    oc project $1
}

function podlogs(){
    echo "Getting logs for $1 for the last $2 duration"
    oc logs -f --since=$2 `oc get pods | grep $1 | grep 'Running' | grep -Ev 'deploy' | awk '{print $1}'`
}

function podport(){
    echo "Forwarding port $2 on $1"
    oc port-forward `oc get pods | grep $1 | grep 'Running' | grep -Ev 'deploy' | awk '{print $1}'` $2
}

d-ip() {
    docker inspect --format "{{ .NetworkSettings.IPAddress }}" $1
}

dkb() {
    docker build -t="$1" .
}

d-grep() {
    docker ps | grep $@ | grep -v ^CONTAINER
}

d-kill-pattern() {
    docker ps \
      | grep $@ \
      | grep -v ^CONTAINER \
      | awk '{print $1}' \
      | xargs -rI % bash -c 'echo $(docker kill %; echo "killed!");'
}

d-pid() {
    docker inspect --format "{{ .State.Pid }}" $1
}

d-purge() {
    docker rm $(docker ps -a -q);
}

d-stats() {
    docker ps -q | xargs docker stats
}

d-stop() {
    # Stop all running containers
    docker stop $(docker ps -a -q);
}

d-zsh() {
    local TAG=$1
    docker run -v /tmp:/host_tmp:rw -i -t $TAG /bin/zsh
}

dps-monitor() {
    while true
    do
        clear
        docker ps | cut -c -$(tput cols)
        sleep 0.5
    done
}

function docker-tags(){
    curl -s -S "https://registry.hub.docker.com/v2/repositories/$@/tags/" | jq '."results"[]["name"]' |sort
}

# Func: Completion on SSH Hosts
bash_completion () {
    # SSH Host completion
    if [ -e ~/.ssh/known_hosts  ] ; then
        complete -W "$(echo `cat ~/.ssh/known_hosts | cut -Func 1 -d '  ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
        # Note: HashKnownHosts need to be set 'no' in /etc/ssh/ssh_config
    fi
}

# Gzip-enabled `curl`
alias gurl='curl --compressed'

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""


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

function web-speed-test {
    # Curls the given address and outputs some nice metrics. Nice for finding where something is slowing things down.
    if [[ $1 ]]; then
        curl -Lw "DNS Lookup: %{time_namelookup} seconds \nRedirects: %{time_redirect} seconds with %{num_redirects} redirects \nFirst Byte: %{time_starttransfer} seconds \nConnect Time: %{time_connect} seconds \nTotal Time: %{time_total} seconds \n" -so /dev/null $1
    else
        echo -e "Usage: $FUNCNAME <url>\nTests and displays HTTP metrics for given URL."
    fi
}

function verify-ssl {
        # Gets information about a given cert. Can be ran against a file, a host, or interactively.
        if [ -z $1 ]; then
                OUTPUT=`openssl x509 -text -noout`
        elif [ -a $1 ]; then
                echo "Found file $1, assuming it's the cert to tested."
                OUTPUT=`openssl x509 -in $1 -text -noout`
        else
                echo "Assuming input is a hostname. Testing on port 443."
                OUTPUT=`openssl s_client -connect $1:443 </dev/null 2>/dev/null | sed -n '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/p' | openssl x509 -text -noout`
        fi;

        echo "$OUTPUT" | grep "Not Before" -C 2
        echo "$OUTPUT" | grep "Alternative Name" -C 1
}

function cmdof() {
    sed 's/\x0/ /g;$a\' /proc/${1}/cmdline;
}

function from-epoch() {
    INPUT="$1"
    EPOCH=`echo $1 | sed -e 's/\..*//'`
    date --date "$[$(date '+%s')-${EPOCH}] seconds ago" '+%Y-%m-%d %H:%M:%S'
}

function du1() {
    UNIT='G'
    if [ -n "$1" ]; then
        UNIT=$1
    fi
    du -hcx --max-depth=1 | grep -E ^[0-9.]+$UNIT | sort -nr
}

function stats() {
    uptime
    awk '/^MemTotal:/{total = $2/1024^2} /^(MemFree|Buffers|Cached):/{sum += $2} END {printf " Memory: %.2fG/%.2fG\n ", sum/1024^2, total}' /proc/meminfo
    ps -eo pcpu | awk '/[0-9]/ {sum += $1} END {printf " CPU: %s%%\n ", sum}'
}

function smart_cat () {
    for file in $* ; do
        if [ "$( file $file|awk '{ print $2  }'  )" == "gzip"  ]; then
            zcat $file
        else
            cat $file
        fi;
    done
}

function apache_accesses_per_hour () {
    smart_cat $* | awk '{print $4}' | awk -F [ '{print $2}' | awk -F : '{print $1 ":" $2 ":00" }' | sort | uniq -c;
}

# Strace for disk monitoring
function sdisk () {
    sudo strace -q -f -e open,stat -p $(pgrep -d ' -p' '.*') 2>&1 | grep -E '(open|stat)'
}

# Random password generator, set to 12 chars:
rand-pass()   {
    echo `</dev/urandom tr -dc 'a-zA-Z0-9-_!@#$%^&*()_+|:<>?='| head -c12`
}

#simpler passwords:
rand-simple()   {
    echo `</dev/urandom tr -dc 'a-zA-Z0-9'| head -c12`
}

# gitignore.io
function gi() { 
	curl -sLw "\n" https://www.gitignore.io/api/$@
}

_gitignoreio_get_command_list() {
  curl -sL https://www.gitignore.io/api/list | tr "," "\n"
}

_gitignoreio () {
  compset -P '*,'
  compadd -S '' `_gitignoreio_get_command_list`
}

compdef _gitignoreio gi
