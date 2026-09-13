#lsd
if (( $+commands[lsd] )); then
    alias ls='lsd'
    alias ll='lsd -l'
    alias la='lsd -la'
    alias lt='lsd -l --group-directories-first --tree --depth=2'
fi

#cofirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

#replace with modern tools
(( $+commands[lazygit] )) && alias lg='lazygit'
(( $+commands[bat] )) && alias cat='bat'
(( $+commands[nvim] )) && alias vi='nvim'

#pwd
##case "$(uname -s)" in
##Linux)
###WSL2 or Centos
##    case "$(cat /proc/version)" in
##        *microsoft*) alias pwd='pwd |clip.exe' ;;
##        *centos*) alias pwd='pwd |xclip -selection clipboard' ;; 
##	  *) ;;
##    esac
##    ;;
##Darwin)
##mac os
##    alias pwd='pwd |pbcopy' ;;
##*)
##    ;;
##esac
#
## New methos using OSC52
[[ -f $HOME/.local/self_bin/yank ]] && alias pw='pwd |tee /dev/fd/2 |yank' #need self_bin/yank and /dev/fd/1 represents the stdout

##vim or neovim
#alias vim='vim -u /home/export/online1/mdt00/shisuan/swustc/jungu/.config/vim/.vimrc'

##ssh with trzsz suport
#alias ssh='trzsz -d ssh'

## SW specific
#NCL and img
#alias ncl='ncl -Qn'
#alias img='img2sixel -w 1200'
#
##git
#alias git="LANG=en_US.UTF-8 git"
#
#alias ncmode="export LD_LIBRARY_PATH=/usr/sw/yyzlib/local_x86/lib/"
#alias ncdump="ncmode;/usr/sw/yyzlib/local_x86/bin/ncdump"
##x86-based mpi
##alias x86='export PATH="$HOME/jungu/local_x86/bin:$PATH" && export LD_LIBRARY_PATH="/home/export/online1/mdt00/shisuan/swustc/jungu/local_x86/lib:/home/export/online1/mdt00/shisuan/swustc/jungu/local_x86/lib64" '
##alias jgps1="export PS1=\"\[\e[1;31m\]bg:\j \[\e[0;32m\]\w\n\[\e[0;37m\][\u\[\e[0;37m\]@\[\e[0;37m\]\h \[\e[0;37m\]\W\[\e[0;37m\]]\$ \[\e[0m\]\" "
#alias dead="cls $HOME/jungu/occupy_node"
#alias watch_log="watch -cd -n 1 \"ls -la log.atmosphere*\" "
#alias watch_output="watch -cd -n 10 \"ls -lta output\""
#alias tail_perl="tail -F log.atmosphere.00000.out  |perl -pe 's/(Timing for)/\e[1;35m\$1\e[0m/g'"
#alias tail_grep="tail -F log.atmosphere.00000.out  |grep -E 'Begin|Timing for integration|summarize'"
#alias tail_grep1="tail -F log.atmosphere.0000.out  |grep -E 'Begin|Timing for integration|summarize'"
#alias IF="cls ~/jungu/MPAS/cases/2106_In-Fa"
#alias TC="cls ~/jungu/MPAS/cases/TCs"
#alias EEA="cls ~/jungu/MPAS/cases/2305Doksuri/EEA"
#alias mesh="cls $MPAS/meshes"
#alias jg="~/.local/bin/vim"
#alias Jstack_new="~/Jstack.1.2.2021021421_test768"
