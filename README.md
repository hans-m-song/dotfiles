# dotfiles

currently only supports osx and debian (with `apt-get`)

installs on all:

- brew
- zsh
- git
- mysql workbench
- slack
- vscodium

installs specific to debian:

- build-essential
- curl
- wget

installs specific to osx:

- iterm2

installs for server:

- pihole
- minidlna
- samba

copies over configs for:

- zsh
- git
- vim
- vscodium

## usage

`./setup.sh`: install/set up

`./server.sh`:  install server specific programs

`./merge.sh`: merge new changes (uses sdiff)

`./codium/export.sh`: export extentions to `codium/extensions.sh`

`./codium/import.sh`: install exported extensions
