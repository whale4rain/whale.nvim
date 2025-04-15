# a self-used neovim config

Small but powerful enough for daily use

## Features

config basic helpful plugins.

- theme: catppuccin
- plugin_manager: Lazy.nvim

## Preview

## Dependence

1. git
2. neovim
3. ripgrep

## Install

you can pull it and move it to `.config/nvim` in Linux or `Users\AppData\Local\nvim` which should work after nvim install automatically.

### Steps(maybe right)

#### Linux

```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

clone repo

```bash
git clone https://github.com/whale4rain/whale.nvim.git ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
```

#### Windows

```bash
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak

git clone https://github.com/whale4rain/whale.nvim.git $env:LOCALAPPDATA\nvim

Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force

nvim
```

## All Plugins

