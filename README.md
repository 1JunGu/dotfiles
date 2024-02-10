# MY dotfiles

## Done list

- [x] Zsh
- [x] Programs
- [x] self_bin
- [x] wezterm
- [x] neovim
- [x] tmux

## To Do list

- [ ] vim

### [tmux](https://github.com/tmux/tmux)

#### [Install](https://github.com/tmux/tmux/wiki/Installing)

1. For Macos, you can install using `brew install tmux`
2. For other systems, you can use AppImage package from [Nelson Enzo](https://github.com/nelsonenzo/tmux-appimagee)

   > To display image in tmux enviroment, please use tmux 3.3+ version and add the following 3 options to your `tmux.conf`:
   > Only for size less than 100KB, because the OSC size limit(maybe)

   ```
   set -g allow-passthrough on

   set -ga update-environment TERM
   set -ga update-environment TERM_PROGRAM
   ```

   > Then restart tmux
   > refer this [blog](https://blog.rockydd.net/preview-images-in-terminal-with-iterm2-tmux-and-vifm) and this [project](https://github.com/wookayin/python-imgcat)

## Usage

1. ZSH
   backup your old zshrc and config and remove; Then
   `stow zsh`

2. Wezterm
   Only useful on your local machine
   `stow wezterm`

3. Tmux
   backuo your own tmux.conf
   `stow tmux`

4. Ssh
   back up your ssh config
   `stow ssh`

5. gitconfig
   `stow git`

6. conda #conda rc
   `stow conda`

7. local(self_bin)
   `stow self_bin`

8. fzf
   `stow fzf`

9. nvim
   `stow nvim`; but don't forget the cache dir and data dir in $HOME/.local/share/nvim
