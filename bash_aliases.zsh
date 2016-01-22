#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# install dtrx package ;)
alias extract='dtrx'

#   ---------------------------------------
#   8.  WEB DEVELOPMENT
#   ---------------------------------------

alias apacheEdit='sudo edit /etc/apache2/apache2.conf'	      	# apacheEdit:       Edit httpd.conf
alias editHosts='sudo edit /etc/hosts'                  	# editHosts:        Edit /etc/hosts file
alias apacheerr='tail /var/log/apache2/error_log'              	# herr:             Tails HTTP error logs

# install  colordiff package :)
alias diff='colordiff'

alias ports='netstat -tulanp'



# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown 0'


# also pass it via sudo so whoever is admin can reload it without calling you #
alias nginxreload='sudo nginx -s reload'
alias nginxtest='sudo nginx -t'
alias lightyload='sudo lighttpd reload'
alias lightytest='sudo lighttpd -f /etc/lighttpd/lighttpd.conf -t'
alias httpdreload='sudo apachectl -k graceful'
alias httpdtest='sudo apachectl -t && apachectl -t -D DUMP_VHOSTS'

## Resume wget by default  ##
alias wget='wget -c'

## set some other defaults ##
alias df='df -H'
alias du='du -ch'

#  ------------------
#  PROCESS MANAGEMENT
#  ------------------

alias startup_services="ls /etc/rc2.d/* | grep S | awk '{sub(\"S\",\" \"); print \$2}'"

# -----------------
# WORKSPACE ALIASES
# -----------------

alias cloopback='cd /home/raven/workspace/privateOutcast/loopback'
alias cmeteor='cd /home/raven/workspace/privateOutcast/meteor'
alias csails='cd /home/raven/workspace/privateOutcast/sails'
alias cofc='cd /home/raven/workspace/ofc'
alias cworkspace='cd /home/raven/workspace'
alias cgit='cd /home/raven/workspace/gitprojects'
alias clivastar='cd /home/raven/workspace/ofc/dev/Livastar'
alias cpersonal='cd /home/raven/workspace/privateOutcast'

# -----------------
# SOME MORE ALIASES
# -----------------

alias cmusserver='/home/raven/bin/cmus --listen 0.0.0.0'
alias xrestart='sudo service lightdm restart'
