# Dotfiles

This repository contains my configuration files (dotfiles) for various
applications.

## Installation

To restore these dotfiles using `stow`, follow the instructions below:

1. **Clone the repository:**
   ```sh
   git clone https://github.com/rogerpoliver/dotfiles.git
   cd dotfiles
   ```

2. **Install GNU Stow:**
   - On macOS:
     ```sh
     brew install stow
     ```
   - On Ubuntu/Debian:
     ```sh
     sudo apt-get install stow
     ```

3. **Stow the dotfiles:**
   ```sh
   stow -t $HOME <package_name>
   ```
   Replace `<package_name>` with the name of the directory containing the
   dotfiles you want to stow. For example, to stow the `zsh` configuration, run:
   ```sh
   stow -t $HOME zsh
   ```

## Directory Structure

```
dotfiles/
├── zsh/
│   ├── .zshrc
│   └── ...
├── vim/
│   ├── .vimrc
│   └── ...
└── ...
```

Each directory inside the `dotfiles` repository represents a package that can be
stowed.

## Unstow Dotfiles

To remove the symlinks created by `stow`, use the `-D` option:

```sh
stow -D -t $HOME <package_name>
```
