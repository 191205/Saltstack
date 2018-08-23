#!/bin/sh
# try to convince anything we can to be XDG compliant
# application specifc environment values come from
# https://wiki.archlinux.org/index.php/XDG_Base_Directory_support

XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local"

# config file locations
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME"/httpie
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export NPM_CONFIG_USERCONFIG="/etc/npm/npmrc"

# local data locations 
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export STACK_ROOT="$XDG_DATA_HOME"/stack

# cache data locations
export LESSHISTFILE="$XDG_CACHE_HOME"/lesshist
export NODE_REPL_HISTORY="$XDG_CACHE_HOME"/nodehist
export PYTHON_EGG_CACHE="$XDG_CACHE_HOME"/python-eggs
export RLWRAP_HOME="$XDG_DATA_HOME"/rlwrap
export HISTFILE="$XDG_DATA_HOME"/history
