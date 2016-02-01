export HOSTNAME=`/usr/sbin/scutil --get HostName`

case $LOGNAME in 
root)   PS1="${HOSTNAME}:\${PWD} \# " ;;
*)  PS1="${HOSTNAME}:\${PWD} \$ " ;;
esac

export PS1 

export VISUAL=vi
export EDITOR=vi

set -o vi
