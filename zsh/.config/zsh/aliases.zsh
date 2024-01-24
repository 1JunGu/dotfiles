#lsd
alias ls="lsd"
alias l='ls -l'
alias la='ls -a'
alias ll='ls -la'
alias lt='ls --tree'
alias tree='lsd -l --group-directories-first --tree --depth=2'

#cofirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

#lazygit
alias lg='lazygit' #needed lazygit binary installed

#pwd
case "$(uname -s)" in

Linux)
#WSL2 or Centos
    case "$(cat /proc/version)" in
        *Microsoft*) alias pwd='pwd |clip.exe' ;;
        *centos*) alias pwd='pwd |xclip -selection clipboard' ;; 
    esac
    alias pwd='pwd |xclip -selection clipboard' ;;
Darwin)
    alias pwd='pwd |pbcopy' ;;


