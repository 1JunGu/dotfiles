#self
function cls() {
    cd $1;ls;
}
function tm() {
    tmux -L "$1" -f ~/.config/tmux/.tmux.conf new-session -A -s "$1"
}
#yazi
function ya() {
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
