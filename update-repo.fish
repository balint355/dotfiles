#!/usr/bin/env fish

function add
    cd pkgbuilds/$argv[1]
    makepkg -src
    mv *.pkg.* ../../repo
    cd ../..
    repo-add repo/balint355.db.tar.zst repo/$argv[1]*.pkg.*
end

function remove
    rm repo/$argv[1]*.pkg.*
    repo-remove repo/balint355.db.tar.zst $argv[1]
end

if test (count $argv) -lt 1
    echo "Invalid number of arguments. Specify one command, and one package name if the command needs it. Valid commands are add, remove, update and all."
    exit 1
end

switch $argv[1]
    # update existing package in repo
    case "update"
        if set -q argv[2]
            if test -d pkgbuilds/$argv[2]
                remove $argv[2]
                add $argv[2]
            end
        end

    # add new package to repo
    case "add"
        if set -q argv[2]
            if test -d pkgbuilds/$argv[2]
                add $argv[2]
            end
        end

    # remove package from repo
    case "remove"
        if set -q argv[2]
            remove $argv[2]
        end

    # rebuild repo with all packages
    case "all"
        rm repo/*
        for i in pkgbuilds/*
            cd $i
            makepkg -src
            mv *.pkg.* ../../repo
            cd ../..
        end
        repo-add repo/balint355.db.tar.zst repo/*.pkg.*
    
    # unknown option
    case "*"
        echo "Unknown option $argv[1]."
        exit 1
end
