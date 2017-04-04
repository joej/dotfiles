
# colors for prompts
#RESET="\[\017\]"
#NORMAL="\[\033[0m\]"
#RED="\[\033[31;1m\]"
#YELLOW="\[\033[33;1m\]"
#MAGENTA="\[\033[35;1m\]"
#WHITE="\[\033[37;1m\]"
#SMILEY="${WHITE}:)${NORMAL}"
#FROWNY="${RED}:(${NORMAL}"
#SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"


export HOSTNAME=`/usr/sbin/scutil --get HostName`

export GIT_PS1_SHOWCOLORHINTS=true
#source  ~/.git-prompt.ksh
source  ~/.git-prompt.sh

# slightly more complex
echo "logname = ${LOGNAME}"
case $LOGNAME in 
    root)   PS1="${HOSTNAME}:\${PWD} \# " 
    ;;
    *)  PS1="\${HOSTNAME}\$(__git_ps1)\$ "
    ;;
esac

# .. Bash: PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#PS1="${HOSTNAME}:\${PWD} \$ " ;;

export PS1 

export VISUAL=vi
export EDITOR=vi
# - shell settings
set -o vi
# - ditch bash's stupid ! issues  (or set +H)
set +o histexpand

# MITRE proxy
test -e "${HOME}/.proxy" && source "${HOME}/.proxy"

# github
export HOMEBREW_GITHUB_API_TOKEN=xxx

# - item2 shell integration for Mac OS X
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"



# - vars to share with item2
function iterm2_print_user_vars() { 
    iterm2_set_user_var gitBranch $(( /usr/local/bin/git branch 2> /dev/null) | /usr/bin/sed -e '/^\*/!d' -e 's/^..//' )
}
# note, I previously used:
#iterm2_set_user_var gitBranch $(( /usr/local/bin/git rev-parse --abbrev-ref HEAD 2>/dev/null ))
#iterm2_set_user_var gitFetchUrl $(( /usr/local/bin/git config --get remote.origin.url ))

# brew
export PATH=$PATH:/usr/local/sbin:/usr/local/opt/apr/bin:
export PYTHONSTARTUP=~/.pythonstartup
export JAVA_HOME=`/usr/libexec/java_home`
export HOMEBREW_GITHUB_API_TOKEN=157ca4b6f108b155f3ed79e0cca66924d6efac1f

# - arch flags
export ARCHFLAGS="-arch x86_64"
# ensure user-install binaries take precedence
export PATH=~/bin:/usr/local/bin:/usr/local/share:/usr/local/Cellar/python/2.7.12/Frameworks/Python.framework/Versions/2.7/bin:$PATH

# -- virtualenv with the wrapper
#export WORKON_HOME=$HOME/VirtualEnvs
#export PROJECT_HOME=$HOME/Devel
#export VIRTUALENVWRAPPER_SCRIPT=/usr/local/Cellar/python/2.7.12/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
#source /usr/local/Cellar/python/2.7.12/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper_lazy.sh

# -- pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

#
# - setup the pyenv command line functions
# from http://fgimian.github.io/blog/2014/04/20/better-python-version-and-environment-management-with-pyenv/
#
if [ -d "${PYENV_ROOT}" ]; then
    echo "pyenv init- "
    eval "$(pyenv init -)"
    #source $HOME/.pyenv_init

    # -- include virtualenv plugin
    # https://github.com/yyuu/pyenv-virtualenv
    echo "pyenv virtualenv-init -"
    eval "$(pyenv virtualenv-init -)"
    #source $HOME/.pyenv_virtualenv_init
    # -- include autoenv
    # so .env files inside projects set post-activate environment vars
    # - fails for KSH: source /usr/local/opt/autoenv/activate.sh
fi

