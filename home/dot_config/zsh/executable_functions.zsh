function cls() {
    cd $1 && ls
}

function tm() {
    local sock_dir="${XDG_DATA_HOME:-$HOME/.local/share}/tmux"
    [[ -d "$sock_dir" ]] || mkdir -p "$sock_dir"
    tmux -S "$sock_dir/$(hostname)-$1.sock" -f $XDG_CONFIG_HOME/tmux/tmux.conf new-session -A -s "$1"
}
#function trim() {
#    convert -trim -background white $1 $1
#}

function trim(){
	if [ -z "$1" ]; then
		echo "Usage: trim <image_file> or trim -a"
		return 1
	elif [ "$1" = "-a" ]; then
		find . -name "*.png" |parallel -P 10 -I% --max-args 1 convert -trim -background white % %
	else
		convert -trim -background white "$1" "$1"
	fi
}

#yazi
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#sw ssh to fat node
function fast() {
	ssh swustc@40.0.0.$1
}
