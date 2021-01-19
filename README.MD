# dotfiles

These are my personal config files and packages for Arch Linux.

## Usage

### Packages

Add the repo to `pacman.conf`:

```
[balint355]
SigLevel = Optional
Server = https://balint355.github.io/dotfiles/repo
```

Install the packages using pacman.

To add, update or remove packages to/from the repo, create or edit a PKGFILE in the appropriate folder in `pkgbuilds`, then run the fish shell script `update-repo.fish` with the appropriate arguments. Valid options are:

- `add <pkgname>`: add new package to repo
- `remove <pkgname>`: remove package from repo
- `update <pkgname>`: update package in repo
- `all`: rebuild all packages in repo

### Config files

To copy the config files to your config directory, run the fish shell script `setup-config.fish`. WARNING: this will delete existing files!
