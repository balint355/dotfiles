#!/usr/bin/env fish

set etc_dir /etc

# get config directory
if set -q XDG_CONFIG_HOME
    set config_dir $XDG_CONFIG_HOME
else
    set config_dir ~/.config
end

function copy_config
    if test ! -e $argv[2]
        mkdir $argv[2]
    end
    
    for i in $argv[1]/$argv[3]/*
        cp -r $i $argv[2]
    end
end

function copy_config_sudo
    if test ! -e $argv[2]
        sudo mkdir $argv[2]
    end

    for i in $argv[1]/$argv[3]/*
        sudo cp -r $i $argv[2]
    end
end

copy_config_sudo etc $etc_dir base
copy_config config $config_dir base

if test (count $argv) -ge 1
    if test -d etc/$argv[1]
        copy_config_sudo etc $etc_dir $argv[1]
    end
    
    if test -d config/$argv[1]
        copy_config config $config_dir $argv[1]
    end
end
