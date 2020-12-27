#!/usr/bin/env fish

# setup configs in config directory
if set -q XDG_CONFIG_HOME
    set config_dir $XDG_CONFIG_HOME
else
    set config_dir ~/.config
end

for i in config/*
    set name (basename $i) 
    set dir $config_dir/$name

    if test -e $dir
        rm -r $dir
    end

    ln -rs $i $config_dir
end
