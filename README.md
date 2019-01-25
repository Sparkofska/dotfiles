# config
This is where my configurations go.

## Depends on
```bash
acpi # battery and thermal information
```

## Install

 Put this in `~/.bashrc`:
```
# source scripts from repo if they exist
if [ -f ~/M/dotfiles/.bash_aliases ]; then
    . ~/M/dotfiles/.bash_aliases
fi
```

*gruvbox theme for gnome terminal*

<https://github.com/Mayccoll/Gogh>
```
sudo apt-get install dconf-cli
wget -O xt https://git.io/v7eBS && chmod +x xt && ./xt && rm xt
```

## Todo

- [ ] make symlink to `.vimrc`
    - `ln -s <target> <linkname>`
- [ ] find the fn-ctrl keymapping
- [ ] move `own.sty` to appropriate location

## Programs I use

This is just a list for myself to memorize which programs I need on a fresh install.

- git
- tmux
- chromium-browser
- evince
- pandoc
- shutter (can be replaced by `gnome-screenshot -i` or `scrot`)

- [ ] a window manager (i3?)
- [ ] a file manager (`ls`?)
- [ ] an image viewer? (feh?)

Less frequently used, can be installed on demand:

- meld (may be replaced by `vimdiff`)
- gimp
- gparted
- virtualbox
- pdftk
