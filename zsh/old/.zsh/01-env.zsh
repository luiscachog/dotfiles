##### HISTORY #####
# Exlude commands on history
HISTORY_IGNORE="(ls|cd|pwd|exit|date|* --help)"
# Keep 200000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=200000
SAVEHIST=400000
HISTFILE=~/.zsh_history

# Command execution time stamp shown in the history command output.
HIST_STAMPS="yyyy-mm-dd"

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

##### PATHS #####
#export MANPATH=/usr/local/man:$MANPATH

##### TEXT EDITOR #####
export EDITOR=vim
export VISUAL=code

##### LANGUAGE #####
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8

export MANPAGER="less -X";

#█▓▒░ java fixes
export _JAVA_AWT_WM_NONREPARENTING=1

##█▓▒░ no mosh titles
export MOSH_TITLE_NOPREFIX=1


