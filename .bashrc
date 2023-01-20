# Add the following linees to ~/.bashrc
## source scripts from repo if they exist
#if [ -f ~/M/dotfiles/.bashrc ]; then
#    . ~/M/dotfiles/.bashrc
#fi

# set vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Mouse and Keyboard settings ##################################################

# set key repeat speed
xset r rate 200 25

# map bildUp and bildDown keys to Home and End
xmodmap -e "keycode 112 = Home"
xmodmap -e "keycode 117 = End"

# xinput --list # get mouse device id by
# xinput --list-props <device id> # show all Properties of device

# 11 is device id of "SynPS/2 Synaptics TouchPad"
#xinput --set-prop 'SynPS/2 Synaptics TouchPad' 293 1 # enable natural scrolling (invert scroll direction)
#xinput --set-prop 'SynPS/2 Synaptics TouchPad' 300 0.8 # increase mouse speed (accelerate)
#xinput --set-prop 'SynPS/2 Synaptics TouchPad' 285 1 # enable click on tap

xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Natural Scrolling Enabled' 1 # enable natural scrolling (invert scroll direction)

#xinput --set-prop 'SynPS/2 Synaptics TouchPad' 300 0.8 # increase mouse speed (accelerate)
xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Accel Speed' 0.8 # increase mouse speed (accelerate)

#xinput --set-prop 'SynPS/2 Synaptics TouchPad' 285 1 # enable click on tap
xinput --set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Tapping Enabled' 1 # enable click on tap

# 12 is device id of "TPPS/2 IBM TrackPoint"
#xinput --set-prop 'TPPS/2 IBM TrackPoint' 300 -0.4 # slow down the trackpoint speed
xinput --set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Speed' -0.4 # slow down the trackpoint speed

# Colors #######################################################################
# Ubuntu shows other writeable dirs blue on green bg. hardly readable: change to default dir appearance.
export LS_COLORS=$LS_COLORS"ow=01;34"

source $(dirname $0)/gruvbox_256palette.sh

# Aliases ######################################################################
alias o='xdg-open'
alias e.='xdg-open . &'
alias bye='sudo shutdown -h now'

alias gis='git status'
alias gid='git diff'
alias gil='git log --decorate --all --oneline --graph'
alias gill='git log'

