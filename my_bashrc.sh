export PS1="\[\e[01;34m\]\h\[\e[m\][\d|\A] \[\e[01;31m\]\w\[\e[m\] \[\e[01;32m\]>>\[\e[m\] "

# check available space
alias myspace='df -h | grep $USER'

# show size
alias size='du -hs .'

# used files
alias who='/usr/sbin/lsof'

# color ls
alias ll='ls -la --color -h'

# color grep
alias grep="grep -n --color" 

# show history
alias h="history"

# edit this bashrc
alias be='gvim ~/.bashrc'

# setup for vscode remote display
alias vs=/home/$USER/.vscode-server/bin/$VS_CODE_VERSION/bin/code
alias dps='__dps'
__dps(){
    if [ "$TERM_PROGRAM" == "vscode" ]; then
        export DISPLAY=:$(ls -t1 ~/.x2go | head -1 | awk -F- '{print $3}')
        echo "Display was set to $DISPLAY"
    fi
}

# configure xterm
alias xterm='xterm -fa 'Monospace' -fs 10'

# lazy cd
alias cd.="cd .."
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias cd....="cd ../../../.."
alias cd.....="cd ../../../../.."

# configure vtune amplifier if available
__vtune()
{
    source $VTUNE_PATH/intel/vtune_amplifier/amplxe-vars.sh
    export LM_LICENSE_FILE=${LM_LICENSE_FILE}
}

alias vtune='__vtune'
