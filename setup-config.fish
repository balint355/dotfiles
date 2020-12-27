#!/usr/bin/env fish

# setup configs in config directory
if set -q XDG_CONFIG_HOME
    set config_dir $XDG_CONFIG_HOME
else
    set config_dir ~/.config
end

function copy_config
    for i in config/$argv[1]/*
        set name (basename $i)
        set dir $config_dir/$name

        if test ! -e $dir
            mkdir $dir
        end

        cp $i/* $dir
    end
end

copy_config base

if test (count $argv) -ge 1
    if test -e config/$argv[1]
        copy_config $argv[1]
    else
        echo "WARNING: config folder $argv[1] doesn't exist"
    end
end
