#!/bin/bash

# directory names of configured apps
dirs=(kitty sway waybar)

# remove configs from config directory
for i in ${dirs[@]}
do
    dir="$HOME/.config/$i"
    if [[ -e $dir ]]
    then
        rm -r "$dir"
    fi
done

# symlink configs to config directory
ln -rs ${dirs[@]} $HOME/.config
