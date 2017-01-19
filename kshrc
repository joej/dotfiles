if [[ -x /usr/sbin/scutil ]]
then
    export HOSTNAME=`/usr/sbin/scutil --get HostName`
fi

if [[ -x /usr/bin/hostname ]]
then
    export HOSTNAME=`/usr/bin/hostname`
fi

case $LOGNAME in 
root)   PS1="${HOSTNAME}:\${PWD} \# " ;;
*)  PS1="${HOSTNAME}:\${PWD} \$ " ;;
esac

export PS1 

export VISUAL=vi
export EDITOR=vi

set -o vi
