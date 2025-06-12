#!/usr/bin/env bash

# Copy configuration files from the repository into the appropriate
# locations. Uses paths relative to this script so the repository can be
# cloned anywhere.

script_dir="$(cd "$(dirname "$0")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"

cp "$repo_root/coc-settings.json" ~/.config/nvim/
cp "$repo_root/bashrc" ~/.bashrc
cp "$repo_root/zshrc" ~/.zshrc
cp "$repo_root/init.vim" ~/.config/nvim/init.vim
cp "$repo_root/zpreztorc" ~/.zprezto/runcoms/zpreztorc
cp "$repo_root/zshenv" ~/.zprezto/runcoms/zshenv
cp "$repo_root/zprofile" ~/.zprezto/runcoms/zprofile
cp "$repo_root/zlogout" ~/.zprezto/runcoms/zlogout
cp "$repo_root/zlogin" ~/.zprezto/runcoms/zlogin
cp "$repo_root/prompt_ssdootz_setup" \
  ~/.zprezto/modules/prompt/functions/prompt_ssdootz_setup
