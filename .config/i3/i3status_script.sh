#!/bin/bash

# there is no way to add a shell script to i3status, it explicitly say so in the i3status manpage
# you can add i3status to a shell script

function determine_tutorial() {
    # this is how to 'return' a string (by settings global variable)
    HELLO_WORLD="Hello World"
}

function determine_keyboard_layout() {
    # query the keyboard layout and set a string depending on the code
    case "$(xset -q|grep LED| awk '{ print $10 }')" in
      "00000002") KBD="us" ;;
      "00001002") KBD="int." ;;
      *) KBD="unknown" ;;
    esac
    # return formatted string
    KEYBOARD_LAYOUT="⌨"$KBD
}

# TODO: change this absolut path
i3status -c ~/M/dotfiles/.config/i3/i3status.conf | while :
do
    read line
    #echo $line || exit 1

    INFO=""

    determine_tutorial
    INFO=$INFO"|"$HELLO_WORLD

    determine_keyboard_layout
    INFO=$INFO"|"$KEYBOARD_LAYOUT

    # TODO: this only sets the color for the whole custom string. Better: set color individually for each item
    # see this tut: <http://docs.slackware.com/howtos:window_managers:keyboard_layout_in_i3#displaying_the_active_layout_in_the_panel>
    DATA="[{ \"full_text\": \"$INFO\", \"color\":\"#EBDBB2\" },"
    echo "${line/[/$DATA}" || exit 1
done
