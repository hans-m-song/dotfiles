#!/bin/bash

codium --list-extensions | xargs -L 1 echo codium --install-extension > ~/dotfiles/codium/export.sh
chmod +x ~/dotfiles/codium/export.sh
