# Dootfiles

A collection of configuration files for zsh, Neovim, tmux and other tools.
These files are tailored for macOS but many settings will work on any Unix
system.

## Prerequisites

The installation scripts assume that [Homebrew](https://brew.sh/) is available
for installing packages. The `install_packages.sh` script will install
Homebrew for you if it is missing.

Neovim plugins such as UltiSnips require Python 3 with the `pynvim` module.
The `install_packages.sh` script installs Python through Homebrew and runs
`pip3 install --user pynvim` so that Neovim can locate its Python provider.
You can verify the setup from within Neovim using `:checkhealth provider`.

## Installation

Clone this repository anywhere on your system and run the provided scripts:

```bash
# Clone the repo
git clone https://github.com/username/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install command line tools and applications
scripts/install_packages.sh

# Copy configuration files into your home directory
scripts/copy_files.sh
```

The copy script places files such as `.zshrc`, `.bashrc` and Neovim
configuration files into the appropriate locations relative to `$HOME`.

After running these scripts, restart your terminal to load the new
configuration.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE)
file for details.
