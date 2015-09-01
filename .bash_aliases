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
alias shutdown='sudo /sbin/shutdown'


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
