# MY dotfiles

## Done list

- [x] Zsh
- [x] Programs
- [x] self_bin
- [x] wezterm
- [x] neovim

## To Do list

- [ ] vim
- [ ] tmux
- [ ] etc.

### [tmux](https://github.com/tmux/tmux)

#### [Install](https://github.com/tmux/tmux/wiki/Installing)

1. For Macos, you can install using `brew install tmux`
2. For other systems, you can use AppImage package from [Nelson Enzo](https://github.com/nelsonenzo/tmux-appimagee)

   > To display image in tmux enviroment, please use tmux 3.3+ version and add the following 3 options to your `tmux.conf`:

   ```
   set -g allow-passthrough on

   set -ga update-environment TERM
   set -ga update-environment TERM_PROGRAM
   ```

   > Then restart tmux
