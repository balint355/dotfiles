#!/bin/bash

# setup configs in config directory
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
for i in config/*; do
    name=$(basename "$i")
    dir="$config_dir/$name"
    if [[ -e $dir ]]; then
        rm -r "$dir"
    fi
    ln -rs "$i" "$config_dir"
done

# setup configs in home directory
for i in home/*; do
    name=$(basename "$i")
    file="$HOME/.$name"
    if [[ -e $file ]]; then
        rm "$file"
    fi
    ln -rs "$i" "$HOME/.$name"
done
