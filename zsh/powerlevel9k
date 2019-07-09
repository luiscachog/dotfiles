#!usr/bin/env zsh
# vim:ft=zsh ts=4 sw=4 noet fenc=utf-8
#=======================================
# POWERLEVEL9K Settings
#=======================================

#=======================================
# GENERAL SETTINGS
#=======================================
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k


# Enable caching of parts of the prompt to make rendering much faster.
POWERLEVEL9K_USE_CACHE=true
POWERLEVEL9K_MAX_CACHE_SIZE=10000

#=======================================
# FONT SUPPORT
#=======================================

# NOTE:
# To use the features below, you have to install the font and make it the default font in your terminal emulator.

# For installation instructions for Powerline Fonts
# See: https://powerline.readthedocs.org/en/latest/installation/linux.html#fonts-installation

# Uncomment if you are using Awesome Powerline Font, and you prefer flat segment transitions
#POWERLEVEL9K_MODE="flat"

# Uncomment if you are using Awesome Terminal Font
# See: https://github.com/gabrielelana/awesome-terminal-fonts
#POWERLEVEL9K_MODE="awesome-fontconfig"

# Uncomment if you are using Awesome Patched Font
# See: https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy/patched
#POWERLEVEL9K_MODE="awesome-flat"

# Uncomment if you are using a Nerd supported font
# See: https://github.com/ryanoasis/nerd-fonts
# POWERLEVEL9K_MODE="nerdfont-fontconfig"
# POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_MODE='nerdfont-complete'

#=======================================
# PROMPT CONFIGURATION
#=======================================

# multiline prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true             # double line prompt
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true            # place the right prompt on second line
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰─▶ "

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true            # new line before prompt
POWERLEVEL9K_DISABLE_RPROMPT=true               # disable the right prompt

# segment/sub segment separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'				# 
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'				# 
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B1'			# 
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0B3'			# 

#POWERLEVEL9K_CUSTOM_RPROMPT=custom_rprompt

#POWERLEVEL9K_CUSTOM_RPROMPT_ICON='\uF005'

#=======================================
# SYSTEM STATUS SEGMENTS
#=======================================

# *****  background_jobs  *****
# If there is more than one background job, this segment will show the number of jobs. Set this to false to turn this feature off.
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=true

# *****  battery  *****
# This segment will display your current battery status (fails gracefully on systems without a battery). It is
# supported on both OSX and Linux (note that it requires acpi on Linux).
POWERLEVEL9K_BATTERY_LOW_THRESHOLD=10						# Threshold to consider battery level critical.
POWERLEVEL9K_BATTERY_VERBOSE=true							# Display time remaining next to battery level.

# *****  context  *****
# The context segment (user@host string) is conditional. By default, it will only print if you are not your "normal"
# user (including if you are root), or if you are SSH"d to a remote host.
#
# To use this feature, make sure the context segment is enabled in your prompt elements (it is by default), and define
# a DEFAULT_USER in your ~/.zshrc.

export DEFAULT_USER="$USER"								# Username to consider a "default context" (you can also
															# set $USER).
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true						# Always show this segment, including $USER and hostname.
POWERLEVEL9K_ALWAYS_SHOW_USER=false							# Always show the username, but conditionalize the
															# hostname.
# POWERLEVEL9K_CONTEXT_TEMPLATE="%n@%m"						# Default context prompt (username@machine).
POWERLEVEL9K_CONTEXT_TEMPLATE="\uF109 %m"						# Default context prompt (username@machine).

# Refer to the ZSH Documentation for all possible expansions, including deeper host depths.
# You can customize the context segment. For example, you can make it to print the full hostname by setting
#POWERLEVEL9K_CONTEXT_TEMPLATE="%n@`hostname -f`"

#POWERLEVEL9K_CONTEXT_HOST_DEPTH=							# variable to change how the hostname is displayed.

# See (ZSH Manual)[http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Login-information] for details.
# The default is set to %m which will show the hostname up to the first ‘.’ You can set it to %{N}m where N is an
# integer to show that many segments of system hostname. Setting N to a negative integer will show that many segments
# from the end of the hostname.

# *****  dir  *****
# The dir segment shows the current working directory. When using the "Awesome Powerline" fonts, there are additional
# glyphs, as well
POWERLEVEL9K_DIR_PATH_ABSOLUTE=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2							# If your shorten strategy, below, is entire directories,
															# this field determines how many directories to leave at
															# the end. If your shorten strategy is by character count,
															# this field determines how many characters to allow per
															# directory string.
POWERLEVEL9K_SHORTEN_STRATEGY="Default"					# How the directory strings should be truncated. See the
															# table below for more informations.
POWERLEVEL9K_SHORTEN_DELIMITER=".."						# Delimiter to use in truncated strings. This can be any
															# string you choose, including an empty string if you wish
															# to have no delimiter.
#POWERLEVEL9K_SHORTEN_DELIMITER="\u2026"						# …

#
#     Strategy Name                  Description
#     -------------                  -----------
#     Default                        Truncate whole directories from left. How many is defined by
#                                    POWERLEVEL9K_SHORTEN_DIR_LENGTH
#     truncate_middle                Truncates the middle part of a folder. E.g. you are in a folder named
#                                    "/MySuperProjects/AwesomeFiles/BoringOffice", then it will truncated to
#                                    "/MyS..cts/Awe..les/BoringOffice", if POWERLEVEL9K_SHORTEN_DIR_LENGTH=3 is also
#                                    set (controls the amount of characters to be left).
#     truncate_from_right            Just leaves the beginning of a folder name untouched. E.g. your folders will be
#                                    truncated like so: "/ro../Pr../office". How many characters will be untouched is
#                                    controlled by POWERLEVEL9K_SHORTEN_DIR_LENGTH.
#     truncate_with_package_name     Search for a package.json or composer.json and prints the name field to
#                                    abbreviate the directory path. The precedence and/or files could be set by
#                                    POWERLEVEL9K_DIR_PACKAGE_FILES=(package.json composer.json). Please note that
#                                    this currently looks for .git directory to determine the root of the project.
#     truncate_with_folder_marker    Search for a file that is specified by POWERLEVEL9K_SHORTEN_FOLDER_MARKER and
#                                    truncate everything before that (if found, otherwise stop on $HOME and ROOT).
#

# Double quotes are important here!
#POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{black} $(print_icon "LEFT_SUBSEGMENT_SEPARATOR") %F{black}"
															# customize the directory separator
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=false					# omit the first character (usually a slash
															# that gets replaced if you set
															# POWERLEVEL9K_DIR_PATH_SEPARATOR)

POWERLEVEL9K_HOME_FOLDER_ABBREVIATION="~"

# *****  dir_writable  *****
# Displays a lock icon, if you do not have write permissions on the current folder.
POWERLEVEL9K_DIR_SHOW_WRITABLE=true

# *****  disk_usage  *****
# The disk_usage segment will show the usage level of the partition that your current working directory resides in.

POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=true					# Hide the segment except when usage levels have hit
															# warning or critical levels.
POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL=90					# The usage level that triggers a warning state.
POWERLEVEL9K_DISK_USAGE_CRITICAL_LEVEL=95					# The usage level that triggers a critical state.

# *****  ram  *****
# Show free RAM.

POWERLEVEL9K_RAM_ELEMENTS="Both"							# Specify ram_free or swap_used to only show one or the
															# other rather than both.


# *****  status  *****
# This segment shows the return code of the last command.

POWERLEVEL9K_STATUS_VERBOSE=false							# show the error code when the last command returned an
															# error and optionally hide this segment when the last
															# command completed successfully by setting
															# POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE to false.
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true					# show this segment when the last command completed
															# successfully in non-verbose mode.
POWERLEVEL9K_STATUS_SHOW_PIPESTATUS=true
POWERLEVEL9K_STATUS_HIDE_SIGNAME=false

# *****  time  *****
# Show system time.

#POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%}"						# ZSH time format to use in this segment.
#POWERLEVEL9K_TIME_FORMAT="%D{%S:%M:%H}"					# Reversed time format
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S \uf073  %d.%m.%y}"	# Output time, date, and a symbol  from the "Awesome
															# Powerline Font" set

# ***** user *****
POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="#"
POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 


# *****  vi_mode  *****
# This segment shows ZSH"s current input mode. Note that this is only useful if you are using the ZSH Line Editor (VI
# mode). You can enable this either by .zshrc configuration or using a plugin, like Oh-My-Zsh"s vi-mode plugin.

POWERLEVEL9K_VI_INSERT_MODE_STRING="INSERT" # 				# String to display while in "Insert" mode.
POWERLEVEL9K_VI_COMMAND_MODE_STRING="NORMAL" # 			# String to display while in "Command" mode.

#=======================================
# DEVELOPMENT ENVIRONMENT SEGMENTS
#=======================================

# *****  vcs  *****
# By default, the vcs segment will provide quite a bit of information.
POWERLEVEL9K_HIDE_BRANCH_ICON=false							# set to hide the branch icon from the segment.
POWERLEVEL9K_SHOW_CHANGESET=true							# set to display the hash/changeset in the segment.
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6						# How many characters of the hash/changeset to display in
															# the segment.
POWERLEVEL9K_VCS_SHOW_SUBMODULE_DIRTY=true					# set to reflect submodule status in the top-level
															# repository prompt.
POWERLEVEL9K_VCS_HIDE_TAGS=true							# set to stop tags being displayed in the segment.
POWERLEVEL9K_VCS_STATUS_COMMAND="$HOME/bin/gitstatus --dirty-max-index-size=4096"

#=======================================
# LANGUAGE SEGMENTS
#=======================================

#---------------------------------------
# GoLang Segments
#---------------------------------------

# *****  go_version - no additional settings  *****
# Show the current GO version

#---------------------------------------
# Python Segments
#---------------------------------------

# *****  virtualenv - no additional settings  *****
# Your Python VirtualEnv.
# See: https://virtualenv.pypa.io/en/latest/

# *****  anaconda  *****
# This segment shows your active anaconda environment. It relies on either the CONDA_ENV_PATH or the CONDA_PREFIX
# (depending on the conda version) environment variable to be set which happens when you properly source activate
# an environment.

#POWERLEVEL9K_ANACONDA_LEFT_DELIMITER="("
#POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=")"

# *****  pyenv - no additional settings  *****
# Your active python version as reported by the first word of pyenv version. Note that the segment is not displayed if
# that word is system i.e. the segment is inactive if you are using system python.
POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false

#=======================================
# CLOUD SEGMENTS
#=======================================

#---------------------------------------
# AWS Segments
#---------------------------------------

# *****  aws  *****
# If you would like to display the current AWS profile, add the aws segment to one of the prompts, and define
# AWS_DEFAULT_PROFILE in your ~/.zshrc

#AWS_DEFAULT_PROFILE=""										# your AWS profile name

#=======================================
# OTHER SEGMENTS
#=======================================

# *****  command_execution_time  *****
# Display the time the previous command took to execute if the time is above
# POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD.
# The time is formatted to be "human readable", and so scales the units based on the length of execution time.
# If you want more precision, just set the POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION field.

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3			# Threshold above which to print this segment. Can be set
															# to 0 to always print.
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2			# Number of digits to use in the fractional part of the
															# time value.

# *****  custom_command  *****
# The custom_... segment allows you to turn the output of a custom command into a prompt segment. As an example, if
# you wanted to create a custom segment to display your WiFi signal strength, you might define a custom segment called
# custom_wifi_signal like this:
#POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="echo signal: \$(nmcli device wifi | grep yes | awk "{print \$8}")"
#POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="blue"
#POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="yellow"

# If you prefer, you can also define the function in your .zshrc rather than putting it in-line with the variable
# export, as shown above. Just don"t forget to invoke your function from your segment! Example code that achieves the
# same result as the above:

#zsh_wifi_signal(){
#    local signal=$(nmcli device wifi | grep yes | awk "{print $8}")
#    local color="%F{yellow}"
#    [[ $signal -gt 75 ]] && color="%F{green}"
#    [[ $signal -lt 50 ]] && color="%F{red}"
#    echo -n "%{$color%}\uf230  $signal%{%f%}" # \uf230 is 
#}
#POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"

#=======================================
# MY CUSTOM SEGMENTS
#=======================================

#=======================================
# COLOR SCHEMES
#=======================================

POWERLEVEL9K_COLOR_SCHEME="dark"							# "light" or "dark"

#=======================================
# MY THEME OVERRIDES: COLORS
#=======================================

#---------------------------------------
# SYSTEM STATUS SEGMENTS
#---------------------------------------

# *****  background_jobs  *****
#POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=""
#POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=""
#POWERLEVEL9K_BACKGROUND_VISUAL_IDENTIFIER_COLOR=""

# *****  battery  *****
#POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND=""
#POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND=""
#POWERLEVEL9K_BATTERY_CHARGED_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND=""
#POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND=""
#POWERLEVEL9K_BATTERY_CHARGING_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND=""
#POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=""
#POWERLEVEL9K_BATTERY_DISCONNECTED_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_BATTERY_LOW_BACKGROUND=""
#POWERLEVEL9K_BATTERY_LOW_FOREGROUND=""
#POWERLEVEL9K_BATTERY_LOW_VISUAL_IDENTIFIER_COLOR=""

# *****  context  *****
#POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=""
#POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=""
#POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=""
#POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=""
#POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER_COLOR=""

# *****  date  *****
#POWERLEVEL9K_DATE_BACKGROUND=""
#POWERLEVEL9K_DATE_FOREGROUND=""
#POWERLEVEL9K_DATE_VISUAL_IDENTIFIER_COLOR=""

# *****  dir  *****
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=""
#POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=""
#POWERLEVEL9K_DIR_DEFAULT_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_DIR_HOME_BACKGROUND=""
#POWERLEVEL9K_DIR_HOME_FOREGROUND=""
#POWERLEVEL9K_DIR_HOME_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=""
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=""
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_VISUAL_IDENTIFIER_COLOR=""

# *****  dir_writeable  *****
#POWERLEVEL9K_DIR_WRITEABLE_BACKGROUND=""
#POWERLEVEL9K_DIR_WRITEABLE_FOREGROUND=""
#POWERLEVEL9K_DIR_WRITEABLE_VISUAL_IDENTIFIER_COLOR=""

# *****  disk_usage  *****
#POWERLEVEL9K_DISK_USAGE_BACKGROUND=""
#POWERLEVEL9K_DISK_USAGE_FOREGROUND=""
#POWERLEVEL9K_DISK_USAGE_VISUAL_IDENTIFIER_COLOR=""

# *****  history  *****
#POWERLEVEL9K_HISTORY_BACKGROUND=""
#POWERLEVEL9K_HISTORY_FOREGROUND=""
#POWERLEVEL9K_HISTORY_VISUAL_IDENTIFIER_COLOR=""

# *****  ip  *****
#POWERLEVEL9K_IP_BACKGROUND=""
#POWERLEVEL9K_IP_FOREGROUND=""
#POWERLEVEL9K_IP_VISUAL_IDENTIFIER_COLOR=""

# *****  load  *****
#POWERLEVEL9K_LOAD_DEFAULT_BACKGROUND=""
#POWERLEVEL9K_LOAD_DEFAULT_FOREGROUND=""
#POWERLEVEL9K_LOAD_DEFAULT_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_LOAD_WARNING_BACKGROUND=""
#POWERLEVEL9K_LOAD_WARNING_FOREGROUND=""
#POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND=""
#POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND=""
#POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR=""

# *****  os_icon  *****
#POWERLEVEL9K_OS_ICON_BACKGROUND=""
#POWERLEVEL9K_OS_ICON_FOREGROUND=""
#POWERLEVEL9K_OS_ICON_VISUAL_IDENTIFIER_COLOR=""

# *****  public_ip  *****
#POWERLEVEL9K_PUBLIC_IP_BACKGROUND=""
#POWERLEVEL9K_PUBLIC_IP_FOREGROUND=""
#POWERLEVEL9K_PUBLIC_IP_VISUAL_IDENTIFIER_COLOR=""

# *****  ram  *****
#POWERLEVEL9K_RAM_BACKGROUND=""
#POWERLEVEL9K_RAM_FOREGROUND=""
#POWERLEVEL9K_RAM_VISUAL_IDENTIFIER_COLOR=""

# *****  ssh  *****
#POWERLEVEL9K_SSH_BACKGROUND=""
#POWERLEVEL9K_SSH_FOREGROUND=""
#POWERLEVEL9K_SSH_VISUAL_IDENTIFIER_COLOR=""

# *****  status  *****
#POWERLEVEL9K_STATUS_ERROR_BACKGROUND=""
#POWERLEVEL9K_STATUS_ERROR_FOREGROUND=""
#POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_STATUS_OK_BACKGROUND=""						# (note: only, if verbose is true)
#POWERLEVEL9K_STATUS_OK_FOREGROUND=""						# (note: only, if verbose is true)
#POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_COLOR=""			# (note: only, if verbose is true)

# *****  swap  *****
#POWERLEVEL9K_SWAP_BACKGROUND=""
#POWERLEVEL9K_SWAP_FOREGROUND=""
#POWERLEVEL9K_SWAP_VISUAL_IDENTIFIER_COLOR=""

# *****  time  *****
#POWERLEVEL9K_TIME_BACKGROUND=""
#POWERLEVEL9K_TIME_FOREGROUND=""
#POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_COLOR=""

# *****  todo  *****
#POWERLEVEL9K_TODO_BACKGROUND=""
#POWERLEVEL9K_TODO_FOREGROUND=""
#POWERLEVEL9K_TODO_VISUAL_IDENTIFIER_COLOR=""

# *****  vi_mode  *****
#POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND=""
#POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND=""
#POWERLEVEL9K_VI_MODE_INSERT_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND=""
#POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND=""
#POWERLEVEL9K_VI_MODE_NORMAL_VISUAL_IDENTIFIER_COLOR=""

#---------------------------------------
# DEVELOPMENT ENVIRONMENT SEGMENTS
#---------------------------------------

# *****  vcs  *****
#POWERLEVEL9K_VCS_CLEAN_BACKGROUND=""
#POWERLEVEL9K_VCS_CLEAN_FOREGROUND=""
#POWERLEVEL9K_VCS_CLEAN_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=""
#POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=""
#POWERLEVEL9K_VCS_UNTRACKED_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=""
#POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=""
#POWERLEVEL9K_VCS_MODIFIED_VISUAL_IDENTIFIER_COLOR=""

#---------------------------------------
# PHP Segments
#---------------------------------------

# *****  symfony_tests  *****
#POWERLEVEL9K_SYMFONY_TESTS_AVG_BACKGROUND=""
#POWERLEVEL9K_SYMFONY_TESTS_AVG_FOREGROUND=""
#POWERLEVEL9K_SYMFONY_TESTS_AVG_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_SYMFONY_TESTS_BAD_BACKGROUND=""
#POWERLEVEL9K_SYMFONY_TESTS_BAD_FOREGROUND=""
#POWERLEVEL9K_SYMFONY_TESTS_BAD_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_SYMFONY_TESTS_GOOD_BACKGROUND=""
#POWERLEVEL9K_SYMFONY_TESTS_GOOD_FOREGROUND=""
#POWERLEVEL9K_SYMFONY_TESTS_GOOD_VISUAL_IDENTIFIER_COLOR=""

#---------------------------------------
# Python Segments
#---------------------------------------

# *****  anaconda  *****

#POWERLEVEL9K_ANACONDA_BACKGROUND=""
#POWERLEVEL9K_ANACONDA_FOREGROUND=""						# Note that you can modify the _FOREGROUND color without
															# affecting the icon color.
#POWERLEVEL9K_ANACONDA_VISUAL_IDENTIFIER_COLOR=""

#---------------------------------------
# Ruby Segments
#---------------------------------------

# *****  rspec_stats  *****
#POWERLEVEL9K_RSPEC_STATS_GOOD_BACKGROUND=""
#POWERLEVEL9K_RSPEC_STATS_GOOD_FOREGROUND=""
#POWERLEVEL9K_RSPEC_STATS_GOOD_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_RSPEC_STATS_AVG_BACKGROUND=""
#POWERLEVEL9K_RSPEC_STATS_AVG_FOREGROUND=""
#POWERLEVEL9K_RSPEC_STATS_AVG_VISUAL_IDENTIFIER_COLOR=""

#POWERLEVEL9K_RSPEC_STATS_BAD_BACKGROUND=""
#POWERLEVEL9K_RSPEC_STATS_BAD_FOREGROUND=""
#POWERLEVEL9K_RSPEC_STATS_BAD_VISUAL_IDENTIFIER_COLOR=""

#---------------------------------------
# OTHER SEGMENTS
#---------------------------------------

# *****  command_execution_time  *****
#POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=""
#POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=""
#POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_COLOR=""

#---------------------------------------
# My Custom Segments
#---------------------------------------

#=======================================
# MY THEME OVERRIDES: ICONS
#=======================================
# use "get_icon_names" to see all icons

# *****  Separators and Icons  *****
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=""
#POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=""
#POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=""
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=""
#POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=""

# *****  General Icons  *****
#POWERLEVEL9K_OK_ICON=""
#POWERLEVEL9K_FAIL_ICON=""
#POWERLEVEL9K_CARRIAGE_RETURN_ICON=""
#POWERLEVEL9K_TODO_ICON=""

#---------------------------------------
# SYSTEM STATUS SEGMENTS
#---------------------------------------

# *****  background_jobs  *****
#POWERLEVEL9K_BACKGROUND_JOBS_ICON=""

# *****  battery  *****
#POWERLEVEL9K_BATTERY_ICON=""

# *****  date  *****
#POWERLEVEL9K_DATE_ICON=""

# *****  dir  *****
#POWERLEVEL9K_HOME_ICON=""
#POWERLEVEL9K_HOME_SUB_ICON=""
#POWERLEVEL9K_FOLDER_ICON=""

# *****  dir_writeable  *****
#POWERLEVEL9K_LOCK_ICON=""

# *****  disk_usage *****
#POWERLEVEL9K_DISK_ICON=""

# *****  history  *****
#POWERLEVEL9K_HISTORY_ICON=""

# *****  ip  *****
#POWERLEVEL9K_NETWORK_ICON=""

# *****  load  *****
#POWERLEVEL9K_LOAD_ICON=""

# *****  os_icon  *****
#POWERLEVEL9K_APPLE_ICON=""
#POWERLEVEL9K_FREEBSD_ICON=""
#POWERLEVEL9K_LINUX_ICON=""
#POWERLEVEL9K_SUNOS_ICON=""

# *****  public_ip  *****
#POWERLEVEL9K_PUBLIC_IP_ICON=""

# *****  ram  *****
#POWERLEVEL9K_RAM_ICON=""

# *****  root_indicator  *****
#POWERLEVEL9K_ROOT_ICON=""

# *****  ssh  *****
#POWERLEVEL9K_SSH_ICON=""

# *****  swap  *****
#POWERLEVEL9K_SWAP_ICON=""

# *****  time  *****
#POWERLEVEL9K_TIME_ICON=""

# *****  todo  *****
#POWERLEVEL9K_TODO_ICON=""

#---------------------------------------
# Development Environment Segments
#---------------------------------------

#POWERLEVEL9K_VCS_GIT_ICON=""
#POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=""
#POWERLEVEL9K_VCS_GIT_GITHUB_ICON=""
#POWERLEVEL9K_VCS_GIT_GITLAB_ICON=""

#POWERLEVEL9K_VCS_HG_ICON=""
#POWERLEVEL9K_VCS_SVN_ICON=""

#POWERLEVEL9K_VCS_BOOKMARK_ICON=""
#POWERLEVEL9K_VCS_BRANCH_ICON=""
#POWERLEVEL9K_VCS_COMMIT_ICON=""
#POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=""
#POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=""
#POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=""
#POWERLEVEL9K_VCS_STAGED_ICON=""
#POWERLEVEL9K_VCS_STASH_ICON=""
#POWERLEVEL9K_VCS_TAG_ICON=""
#POWERLEVEL9K_VCS_UNSTAGED_ICON=""
#POWERLEVEL9K_VCS_UNTRACKED_ICON=""

#---------------------------------------
# Javascript / Node.js Segments
#---------------------------------------

#POWERLEVEL9K_NODE_ICON=""

#---------------------------------------
# PHP Segments
#---------------------------------------

# *****  symfony_tests  *****
#POWERLEVEL9K_SYMFONY_ICON=""
#POWERLEVEL9K_TEST_ICON=""									# this icon is used for both symfony2_test and rspec_stats

#---------------------------------------
# Python Segments
#---------------------------------------

#POWERLEVEL9K_PYTHON_ICON=""

#---------------------------------------
# Ruby Segments
#---------------------------------------

#POWERLEVEL9K_RUBY_ICON=""

# *****  rspec_stats  *****
#POWERLEVEL9K_TEST_ICON=""									# this icon is used for both symfony2_test and rspec_stats

#---------------------------------------
# Rust Segments
#---------------------------------------

#POWERLEVEL9K_RUST_ICON=""

#---------------------------------------
# Swift Segments
#---------------------------------------

#POWERLEVEL9K_SWIFT_ICON=""

#---------------------------------------
# AWS Segments
#---------------------------------------

# *****  aws  *****
#POWERLEVEL9K_AWS_ICON=""
#POWERLEVEL9K_AWS_EB_ICON=""

#---------------------------------------
# Docker Segments
#---------------------------------------

# *****  docker_machine  *****
#POWERLEVEL9K_SERVER_ICON=""

#---------------------------------------
# OTHER SEGMENTS
#---------------------------------------

# *****  execution_time  *****
#POWERLEVEL9K_EXECUTION_TIME_ICON=""

#=======================================
# PROMPT CUSTOMIZATION
#=======================================
# Choose which segments to display in your prompt

# Segment list for left prompt
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon battery time ram disk_usage context status_joined custom_service go_version nvm virtualenv anaconda pyenv docker_machine aws rbenv vcs dir command_execution_time_joined)

# Segment list for right prompt
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs ssh history )

# You can also use different prompts in different environments, e.g. for TMUX, you might use
if [[ "${TERM}" =~ "tmux" || "${TERM}" =~ "screen" ]]; then
#	# Segment list for left prompt
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir_writable dir background_jobs command_execution_time vi_mode)
#	# Segment list for right prompt
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs rbenv todo)
else
#	# Segment list for left prompt
#	POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir_writable dir background_jobs command_execution_time vi_mode)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon 
	time 
	battery
	ram 
	disk_usage 
	context 
	status_joined 
	command_execution_time_joined 
	custom_service go_version 
	nvm 
	virtualenv 
	anaconda 
	pyenv 
	docker_machine 
	aws 
	rbenv 
	vcs dir_writable 
	root_indicator
	dir 
)

#	# Segment list for right prompt
#	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs rbenv todo date time battery)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs ssh history )

fi











# POWERLEVEL9K_CUSTOM_COMMAND_TIME="zsh_command_time"
# POWERLEVEL9K_CUSTOM_COMMAND_TIME_BACKGROUND="253" # white
# POWERLEVEL9K_CUSTOM_COMMAND_TIME_FOREGROUND="000" # black

#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context go_version virtualenv anaconda pyenv docker_machine kubecontext dir rbenv vcs dir_writable)
# POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last



#POWERLEVEL9K_CUSTOM_SERVICE="zsh_kubens"



