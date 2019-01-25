
# set vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Mouse and Keyboard settings ##################################################

# set key repeat speed
xset r rate 200 25


# xinput --list # get mouse device id by
# xinput --list-props <device id> # show all Properties of device

# 11 is device id of "SynPS/2 Synaptics TouchPad"
xinput --set-prop 'SynPS/2 Synaptics TouchPad' 293 1 # enable natural scrolling (invert scroll direction)
xinput --set-prop 'SynPS/2 Synaptics TouchPad' 300 0.8 # increase mouse speed (accelerate)

# 12 is device id of "TPPS/2 IBM TrackPoint"
xinput --set-prop 'TPPS/2 IBM TrackPoint' 300 -0.4 # slow down the trackpoint speed

# Aliases ######################################################################
alias ..='cd ..'
alias reload='source ~/.bashrc'
alias o='xdg-open'
alias e.='xdg-open . &'
alias bye='sudo shutdown -h now'

alias configbash='vim /home/jonas/M/dotfiles/.bashrc'
alias configi3='vim ~/.config/i3/config'

alias gis='git status'
alias gid='git diff'

alias cdm='cd ~/M'
alias cdwiki='cd ~/M/wiki'
