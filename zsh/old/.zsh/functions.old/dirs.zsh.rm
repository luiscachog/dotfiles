# Create a new directory and enter it
mkd() {
  mkdir -p "$@"
  cd "$@" || exit
}

# Make a temporary directory and enter it
tmpd() {
  local dir
  if [ $# -eq 0 ]; then
    dir=$(mktemp -d)
  else
    dir=$(mktemp -d -t "${1}.XXXXXXXXXX")
  fi
  cd "$dir" || exit
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
o() {
	if [ $# -eq 0 ]; then
		xdg-open .	> /dev/null 2>&1
	else
		xdg-open "$@" > /dev/null 2>&1
	fi
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
tre() {
	tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}

# get dbus session
dbs() {
	local t=$1
	if [[  -z "$t" ]]; then
		local t="session"
	fi

	dbus-send --$t --dest=org.freedesktop.DBus \
		--type=method_call	--print-reply \
		/org/freedesktop/DBus org.freedesktop.DBus.ListNames
}

# backup home directory to nas resource
bknas(){
  if $(df | grep -q /mnt/nas); then
    echo "mounted"
  else
    echo "not mounted"
    sudo mount -t nfs nas01.lan.luiscachog.io:/mnt/HD/HD_a2/LuisCacho /mnt/nas
    echo "mounted NOW"
  fi
  
  sudo /usr/bin/rsync -artuv -l \
    --exclude=.ansible/tmp \
    --exclude=.cache \
    --exclude=.cargo \
    --exclude=.Private \
    --exclude=Cache \
    --exclude=cache \
    --exclude=.node_modules_global \
    --exclude=.npm \
    --exclude=.vscode \
    --exclude=.anaconda \
    --exclude=.config/Station \
    --exclude=.config/chromium \
    --exclude=.local/share/Trash \
    --exclude=.fontconfig \
    --exclude=.config/Franz \
    --exclude=.config/Code/CachedData \
    --exclude=.var/app/org.gnome.FeedReader \
    ~/ /mnt/nas/backup2018  | pv -les $(find ~ | wc -l)                                                                                                                                                                    
    
    # --exclude=.pyenv \
    # --exclude=..virtualenvs \
    #--exclude=Dropbox \
}

