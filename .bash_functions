#  ----------
#  Git Tweaks
#  ----------
lazygit() {
        if [[ -z $1 ]] ; then
        	git add .
        	git commit -a
        	git push
	else
        	git add .
        	git commit -a -m "$1"
        	git push
	fi
}

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
#   --------------------------------------------------------------------
mans () {
	man $1 | grep -iC2 --color=always $2 | less
}

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/.bash_aliases | grep -v '^\s*$' | less -FSRXc ; }


#   -------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

zipf () { zip -r "$1".zip "$1" ; }          	# zipf:         To create a ZIP archive of a folder

# LS Alias functions

lsd () {
        if [[ -z $1 ]] ; then
                command ls -alF | grep /$
        else
                command ls -alF "$1" | grep /$
        fi
}

# numFiles:     Count of non-hidden files in current dir
numFiles () { 
	if [[ -z $1 ]] ; then
		command ls -1 . | wc -l ;
	else
		command ls -1 "$1" | wc -l ;
	fi
}

# up NUM jumps up NUM dirs
function up {
	ups=""
	for i in $(seq 1 $1)
		do
			ups=$ups"../"
		done
	cd $ups
}

mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash

#   ---------------------------
#   5.  PROCESS MANAGEMENT
#   ---------------------------

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
findPid () { lsof -t -c "$@" ; }


#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }
grabhttpHeaders () { /usr/bin/curl -I -L $@ ; }             # httpHeaders:      Grabs headers from web page

ccontent () { cat '$@' | xclip -i -selection clipboard ; }	# Copy Contents of file to clipboard


#  Some more helpful functions
#  ----------------------------------

listservers() { awk '{if($1=="Host")k=$2;if($1=="HostName")printf("%s\t\t%s\n",k,$2)}' /home/raven/.ssh/config; }
