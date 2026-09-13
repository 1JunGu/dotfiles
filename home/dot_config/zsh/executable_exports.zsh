# PATH
typeset -U path # unique path entries
path=($HOME/.local/bin $HOME/.local/self_bin $path) # add custom bin directories to the front of the path

# editors
export EDITOR=nvim

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt SHARE_HISTORY            # Share history between all sessions (implies INC_APPEND_HISTORY)
#setopt INC_APPEND_HISTORY      # Write to the history file immediately, not when the shell exits
setopt HIST_IGNORE_ALL_DUPS     # Delete old recorded entry if new entry is a duplicate (supersedes HIST_IGNORE_DUPS)
#setopt HIST_IGNORE_DUPS        # Don't record an entry that was just recorded again
setopt HIST_IGNORE_SPACE        # Don't record an entry starting with a space
setopt HIST_REDUCE_BLANKS       # Remove superfluous blanks before recording entry
setopt HIST_VERIFY              # Don't execute immediately upon history expansion

setopt EXTENDED_HISTORY         # Write the history file in the ":start:elapsed;command" format
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicate entries first when trimming history
setopt HIST_FIND_NO_DUPS        # Don't display duplicates when searching history
setopt HIST_SAVE_NO_DUPS        # Don't write duplicate entries in history file

## usage
setopt correct_all              # Spell correction for commands and arguments
setopt BANG_HIST                # Treat the '!' character specially during expansion
setopt autocd                   # auto cd without cd prefix
setopt nomatch                  # do not complain about unmatched glob patterns
setopt notify                   # notify when job is done

unsetopt beep                   # disable beep sound
#unsetopt extendedglob          # contradictory with zcompdump(#qN.mh+24)


# sw specific
#export PATH=$HOME/jungu/.cargo/bin:$PATH
##export PATH=$HOME/.local/bin:$PATH
#export PATH=$HOME/jungu/local/bin:$PATH
#export PATH=$HOME/jungu/.local/bin:$PATH
#export PATH=$HOME/jungu/.local/self_bin:$PATH
#export LD_LIBRARY_PATH=$HOME/jungu/.local/lib:$LD_LIBRARY_PATH
##ImageMagick
#export PATH=$HOME/jungu/local/ImageMagick-7.1.1/bin:$PATH
### ncl-6.6.2
#export NCARG_ROOT=$HOME/jungu/local/ncl-6.6.2
#export NCARG_SELF=$HOME/jungu/.config/ncl
#export PATH=$NCARG_ROOT/bin:$PATH
#export NCARG_COLORMAPS=$NCARG_SELF/colormaps:$NCARG_ROOT/lib/ncarg/colormaps
##
#export MPAS="/home/export/online1/mdt00/shisuan/swustc/jungu/MPAS"

#export HDF5_USE_FILE_LOCKING=FALSE
