#!/usr/bin/env fish

# make packages and add them to repo
for i in pkgbuilds/*
    cd $i
    makepkg -sc
    mv *.pkg.* ../../repo
    cd ../..
end

repo-add repo/balint355.db.tar.zst repo/*.pkg.*
