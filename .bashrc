# .bashrc for Mac OX

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi



if [ "$PS1" ]; then
	alias rm='rm -i'
	alias cp='cp -i'
	alias mv='mv -i'
	# -> Prevents accidentally clobbering files.
	alias mkdir='mkdir -p'
	alias crontab='crontab -i'

	alias h='history'
	alias j='jobs -l'
	alias which='type -all'
	alias ..='cd ..'
	alias path='echo -e ${PATH//:/\\n}'
	alias du='du -kh'
	alias df='df -kTh'

	# The 'ls' family (this assumes you use the GNU ls)
	alias ll='ls -lh'
	alias la='ls -Al'               # show hidden files
	#alias ls='ls -hF --color'       # add colors for filetype recognition
    alias ls='ls -G'
	alias lx='ls -lXB'              # sort by extension
	alias lk='ls -lSr'              # sort by size
	alias lc='ls -lcr'              # sort by change time
	alias lu='ls -lur'              # sort by access time
	alias lr='ls -lR'               # recursive ls
	alias lt='ls -ltr'              # sort by date
	alias lm='ls -al |more'         # pipe through 'more'
	alias tree='tree -Csu'          # nice alternative to 'ls' 
	alias grep='grep -E --color'

	alias iv='info --vi-keys'       # invoke info with vi-like key bindings

	PS1='\u@\h:\w\$ '
	# PS1='\033[36;40m`date '+%H:%M'`\033[00m $PWD>'
	# PS1='\033[36;40m`date '+%H:%M'`\033[00m \u@\h:\w\$ '

	# set ls colors
	#LS_COLORS3='*.tar=01;33:*.tgz=01;33:*.arj=01;33:*.zip=01;33:*.z=01;33:*.Z=01;33'
	#LS_COLORS4='*.gz=01;33:*.bz2=01;33:*.deb=01;33:*.h=01;33:*.c=01;36:*.cc=01;36'
	#LS_COLORS5='*.cpp=01;36:*.cxx=01;36:*.vhd=01;36:*.jpg=01;31:*.vhdl=01;36'
	#LS_COLORS6='*.spec=01;33:*akefile=01;32'
	#export LS_COLORS=$LS_COLORS1:$LS_COLORS2:$LS_COLORS3:$LS_COLORS4:$LS_COLORS5:$LS_COLORS6

	cd()
	{   
		if [[ $# == 0 ]]; then
			command cd
		else
			command cd "$*"
		fi
		ls -G
	} 
fi
# vi mode for bash
#set -o vi

#export SYSSCREENRC=$HOME/etc/screen/screenrc
