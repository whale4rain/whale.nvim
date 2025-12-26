# Neovim Configuration with vim.pack

A comprehensive Neovim configuration using the native vim.pack package manager.

## Quick Start

```powershell
# Windows
cd $env:LOCALAPPDATA\nvim
.\pack-manager.ps1 install
nvim
```

## Documentation

- **[GUIDE.md](GUIDE.md)** - Complete guide (installation, configuration, troubleshooting)
- **[REFERENCE.md](REFERENCE.md)** - Quick reference card (commands, keybindings)

## Features

- Native vim.pack package manager (Neovim 0.10+)
- 50+ plugins configured
- LSP, Treesitter, Git integration
- AI assistants (Supermaven, Copilot)
- Fast startup and performance

## Key Plugins

- **LSP**: nvim-lspconfig, mason.nvim
- **Completion**: blink.cmp
- **Syntax**: nvim-treesitter
- **File Navigation**: nvim-tree, oil.nvim, telescope
- **Git**: gitsigns, diffview
- **UI**: lualine, barbar, incline

## Plugin Management

```powershell
.\pack-manager.ps1 install    # Install all plugins
.\pack-manager.ps1 update     # Update all plugins
.\pack-manager.ps1 list       # List plugin status
.\pack-manager.ps1 clean      # Remove unused plugins
```

## Essential Key Bindings

Leader: `Space`

- `<leader>ee` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>ca` - Code actions
- `K` - Hover documentation
- `s` - Flash jump

See [REFERENCE.md](REFERENCE.md) for complete list.

## Adding a Plugin

1. Edit [lua/config/pack.lua](lua/config/pack.lua) - add `{ "author/plugin" }`
2. Run `.\pack-manager.ps1 install`
3. Configure in [lua/config/plugins.lua](lua/config/plugins.lua)
4. Restart Neovim

## Troubleshooting

```vim
:checkhealth        " Check system health
:messages           " View error messages
:LspInfo            " Check LSP status
```

See [GUIDE.md](GUIDE.md) for detailed troubleshooting.

## License

MIT

---

**Made with ❤️ for Neovim**
