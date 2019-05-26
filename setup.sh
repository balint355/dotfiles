#!/bin/bash

# config directories of programs in config dir
config_dirs=(kitty sway waybar)

# filenames of configs outside the config dir, in home
files=(zprofile zshrc)

# remove configs from config directory
for i in ${config_dirs[@]}
do
    dir=$HOME/.config/$i
    if [[ -e $dir ]]
    then
        rm -r $dir
    fi
done

# symlink configs to config directory
ln -rs ${config_dirs[@]} $HOME/.config

# remove configs from home directory
for i in ${files[@]}
do
    file=$HOME/.$i
    if [[ -e $file ]]
    then
        rm $file
    fi
done

# symlink configs to home directory
for i in ${files[@]}
do
    ln -rs $i $HOME/.$i
done
