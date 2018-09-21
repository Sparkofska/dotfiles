

## Some notes to save for new os install

This was in my `/etc/fstab/` file to mount second harddrive on boot

```
# second harddrive to ~/M
# diese Zeile ist fuer die zweite HDD Festplatte: noch nicht getestet, ob es wie gewuenscht funktioniert
#UUID=C0284C84284C7C02 /home/jonas/M ntfs user,rw,umask=111,dmask=000 0 0
UUID=C0284C84284C7C02 /home/jonas/M ntfs defaults 0 0
```

These lines were appended to my `~/.bashrc` file

```
################################################################
# jonasm settings here #########################################
################################################################

# for aliases go to ~/.bashrc_aliases

# disable ctrl-s freezing terminal (vim mapping uses ctrl-s for saving files)
stty -ixon

# Changed Color Code of 'ls' (blue on green was hardly readable)
eval "$(dircolors ~/.dircolors)";

# map bildUp and bildDown keys to Home and End
xmodmap -e "keycode 112 = Home"
xmodmap -e "keycode 117 = End"

# It's convenient if the ROS environment variables are automatically added to your bash session every time a new shell is launched:
#source /opt/ros/kinetic/setup.bash

export OpenCV_DIR=/usr/local/share/OpenCV

# source scripts from repo if they exist
if [ -f ~/M/dotfiles/.bash_aliases ]; then
    . ~/M/dotfiles/.bash_aliases
fi
```

This was my `.xinitrc`

```
# The ~/.xinitrc file is a shell script read by xinit and by its front-end startx.
# It is mainly used to execute desktop environments, window managers and other
# programs when starting the X server (e.g., starting daemons and setting environment variables).
xmodmap .Xmodmap
```
