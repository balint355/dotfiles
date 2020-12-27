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

To add a new package to the repo or update an existing one, create or edit a PKGFILE in the appropriate folder in `pkgbuilds`, then run the fish shell script `setup-pkgs.fish`. This will build the package and move it to the repository.

### Config files

To copy the config files to your config directory, run the fish shell script `setup-config.fish`. WARNING: this will delete existing files!
