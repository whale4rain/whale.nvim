# Neovim Configuration Guide

**A Self-Used Neovim Config using vim.pack (Native Package Manager)**

---

## Table of Contents

1. [Overview](#overview)
2. [Installation](#installation)
3. [Plugin Management](#plugin-management)
4. [Quick Start](#quick-start)
5. [Configuration](#configuration)
6. [Key Bindings](#key-bindings)
7. [Adding/Removing Plugins](#adding-removing-plugins)
8. [Migration from lazy.nvim](#migration-from-lazynvim)
9. [Troubleshooting](#troubleshooting)

---

## Overview

This is a comprehensive Neovim configuration using **vim.pack**, Neovim's native package manager (requires Neovim 0.10+).

### Features

- **Native Package Manager**: Uses built-in `vim.pack` (no external dependencies)
- **Theme**: blue-whale
- **50+ Plugins**: LSP, Treesitter, Git integration, AI assistants, and more
- **Fast Startup**: Native package loading for optimal performance
- **Well-Documented**: Comprehensive guides included

### Key Plugins

- **LSP**: nvim-lspconfig, mason.nvim (5 LSP servers configured)
- **Completion**: blink.cmp
- **Syntax**: nvim-treesitter (12+ languages)
- **File Navigation**: nvim-tree, oil.nvim, telescope
- **Git**: gitsigns, diffview
- **UI**: lualine, barbar, incline, snacks, modes
- **AI Assistants**: supermaven, copilot
- **And many more...**

### Why vim.pack?

- ✅ **Built-in**: No external dependencies, part of Neovim core
- ✅ **Fast**: Native implementation with minimal overhead
- ✅ **Simple**: Less abstraction, more control
- ✅ **Future-proof**: Maintained by Neovim team
- ✅ **Stable**: Part of stable API

### Dependencies

1. **Git** (required for plugin installation)
2. **Neovim 0.10+** (with native vim.pack support)
3. **ripgrep** (optional, for telescope search)
4. **PowerShell** (Windows) or **Bash** (Linux) for plugin management script

---

## Installation

### Windows

```powershell
# 1. Backup existing config
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak -ErrorAction SilentlyContinue

# 2. Backup existing data (optional but recommended)
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak -ErrorAction SilentlyContinue

# 3. Clone this repository
git clone https://github.com/whale4rain/whale.nvim.git $env:LOCALAPPDATA\nvim
cd $env:LOCALAPPDATA\nvim
Remove-Item .git -Recurse -Force

# 4. Install plugins
.\pack-manager.ps1 install

# 5. Start Neovim
nvim
```

### Linux/macOS

```bash
# 1. Backup existing config
mv ~/.config/nvim{,.bak}

# 2. Backup existing data (optional but recommended)
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# 3. Clone this repository
git clone https://github.com/whale4rain/whale.nvim.git ~/.config/nvim
cd ~/.config/nvim
rm -rf .git

# 4. Install plugins (requires PowerShell Core)
pwsh pack-manager.ps1 install

# Or manually install key plugins
mkdir -p ~/.local/share/nvim/pack/plugins/start
cd ~/.local/share/nvim/pack/plugins/start
git clone --depth 1 https://github.com/neovim/nvim-lspconfig
git clone --depth 1 https://github.com/nvim-treesitter/nvim-treesitter
# ... (add more plugins as needed)

# 5. Start Neovim
nvim
```

### First Launch

On first launch, Neovim will:

1. Initialize the vim.pack system
2. Load all configured plugins
3. Show any configuration messages
4. Be ready to use!

---

## Plugin Management

This config uses **Neovim's native `vim.pack`** package manager. A PowerShell script is provided for convenience.

### CLI Commands

```powershell
# Windows
.\pack-manager.ps1 install    # Install all configured plugins
.\pack-manager.ps1 update     # Update all plugins to latest versions
.\pack-manager.ps1 list       # List all configured plugins and their status
.\pack-manager.ps1 clean      # Remove unused plugins
```

```bash
# Linux/macOS (with PowerShell Core)
pwsh pack-manager.ps1 install
pwsh pack-manager.ps1 update
pwsh pack-manager.ps1 list
pwsh pack-manager.ps1 clean
```

### Native Commands (In Neovim)

```vim
" Update all plugins
:lua vim.pack.update()

" Update specific plugins
:lua vim.pack.update({ 'plugin1', 'plugin2' })

" Get plugin info
:lua vim.print(vim.pack.get())

" Remove plugins
:lua vim.pack.del({ 'plugin1' })
```

### File Locations

**Windows:**
```
Config:  %LOCALAPPDATA%\nvim
Data:    %LOCALAPPDATA%\nvim-data
Plugins: %LOCALAPPDATA%\nvim-data\pack\plugins\start
```

**Linux/macOS:**
```
Config:  ~/.config/nvim
Data:    ~/.local/share/nvim
Plugins: ~/.local/share/nvim/pack/plugins/start
```

---

## Quick Start

### Essential Commands

```vim
" Check health
:checkhealth

" Check plugin status
:lua vim.print(vim.pack.get())

" Check LSP status
:LspInfo

" Check Treesitter
:TSInstallInfo

" View messages
:messages
```

### Configuration Files

| File | Purpose |
|------|---------|
| `init.lua` | Entry point |
| `lua/config/options.lua` | Neovim settings |
| `lua/config/keymaps.lua` | Key bindings |
| `lua/config/pack.lua` | **Plugin declarations** ⭐ |
| `lua/config/plugins.lua` | **Plugin configurations** ⭐ |
| `lua/config/colorscheme.lua` | Color scheme setup |

⭐ = Main files to edit for plugin management

### Directory Structure

```
nvim/
├── init.lua                    # Entry point
├── pack-manager.ps1            # Plugin management script
├── lua/
│   ├── config/
│   │   ├── options.lua        # Neovim options
│   │   ├── keymaps.lua        # Key mappings
│   │   ├── pack.lua           # vim.pack plugin declarations
│   │   ├── plugins.lua        # Plugin configurations
│   │   └── colorscheme.lua    # Color scheme setup
│   └── plugins/               # Individual plugin configs (legacy)
│       ├── lsp/
│       │   ├── lspconfig.lua
│       │   ├── mason.lua
│       │   ├── formatting.lua
│       │   └── linting.lua
│       └── ...
├── GUIDE.md                    # This file
└── REFERENCE.md               # Quick reference
```

---

## Configuration

### Customizing Settings

Edit `lua/config/options.lua` to change Neovim settings:

```lua
vim.opt.number = true          -- Line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.tabstop = 4           -- Tab width
vim.opt.shiftwidth = 4        -- Indent width
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.wrap = false          -- Don't wrap lines
vim.opt.cursorline = true     -- Highlight current line
```

### Adding Key Mappings

Edit `lua/config/keymaps.lua` to add custom key bindings:

```lua
-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Quit
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Split windows
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })
```

### Changing Colorscheme

Edit `lua/config/colorscheme.lua`:

```lua
-- Available: "blue-whale", "mellifluous"
vim.cmd("colorscheme blue-whale")
```

---

## Key Bindings

Leader key is **Space**

### File Navigation

| Key | Action | Plugin |
|-----|--------|--------|
| `<leader>ee` | Toggle file explorer | nvim-tree |
| `<leader>ef` | Focus file explorer | nvim-tree |
| `-` | Open Oil file manager | oil.nvim |
| `<leader>ff` | Find files | telescope |
| `<leader>fg` | Live grep | telescope |
| `<leader>fb` | Browse buffers | telescope |
| `<leader>fh` | Help tags | telescope |

### LSP

| Key | Action | Plugin |
|-----|--------|--------|
| `K` | Hover documentation | LSP |
| `<leader>ca` | Code actions | LSP |
| `<leader>rn` | Rename symbol | LSP |
| `<leader>rs` | Restart LSP | LSP |
| `gd` | Go to definition | LSP |
| `gr` | Go to references | LSP |
| `gi` | Go to implementation | LSP |
| `<leader>d` | Show diagnostics | LSP |

### Git

| Key | Action | Plugin |
|-----|--------|--------|
| `<leader>hs` | Stage hunk | gitsigns |
| `<leader>hr` | Reset hunk | gitsigns |
| `<leader>hS` | Stage buffer | gitsigns |
| `<leader>hu` | Undo stage hunk | gitsigns |
| `<leader>hR` | Reset buffer | gitsigns |
| `<leader>hp` | Preview hunk | gitsigns |
| `<leader>hb` | Blame line | gitsigns |
| `<leader>hd` | Diff this | gitsigns |
| `]h` | Next hunk | gitsigns |
| `[h` | Previous hunk | gitsigns |

### Navigation

| Key | Action | Plugin |
|-----|--------|--------|
| `s` | Flash jump | flash.nvim |
| `S` | Flash treesitter | flash.nvim |
| `r` | Flash remote | flash.nvim |
| `R` | Flash treesitter search | flash.nvim |
| `Ctrl+h/j/k/l` | Window navigation | Built-in |
| `<leader>sv` | Vertical split | Built-in |
| `<leader>sh` | Horizontal split | Built-in |

### Terminal

| Key | Action | Plugin |
|-----|--------|--------|
| `<leader>th` | Horizontal terminal | toggleterm |
| `<leader>tv` | Vertical terminal | toggleterm |
| `<leader>tf` | Floating terminal | toggleterm |
| `Ctrl+\` | Toggle terminal | toggleterm |

### Editing

| Key | Action | Plugin |
|-----|--------|--------|
| `<Tab>` | Accept completion | blink.cmp |
| `Ctrl+n/p` | Navigate completions | blink.cmp |
| `ys{motion}{char}` | Add surround | nvim-surround |
| `ds{char}` | Delete surround | nvim-surround |
| `cs{old}{new}` | Change surround | nvim-surround |

### Diagnostics

| Key | Action | Plugin |
|-----|--------|--------|
| `<leader>xw` | Workspace diagnostics | trouble |
| `<leader>xd` | Document diagnostics | trouble |
| `<leader>xq` | Quickfix list | trouble |
| `<leader>xl` | Location list | trouble |
| `[d` | Previous diagnostic | Built-in |
| `]d` | Next diagnostic | Built-in |

---

## Adding/Removing Plugins

### Adding a New Plugin

**Step 1**: Declare in `lua/config/pack.lua`

```lua
local plugins = {
  -- ... existing plugins ...
  
  -- Add your plugin here
  { "author/plugin-name" },
}
```

**Step 2**: Install the plugin

```powershell
.\pack-manager.ps1 install
```

**Step 3**: Configure in `lua/config/plugins.lua`

```lua
-- Add configuration
safe_setup("plugin-name", function(plugin)
  plugin.setup({
    -- Your configuration here
  })
end)
```

**Step 4**: Restart Neovim

```powershell
nvim
```

### Removing a Plugin

**Step 1**: Remove from `lua/config/pack.lua`

Delete the line containing the plugin declaration.

**Step 2**: Remove configuration from `lua/config/plugins.lua`

Delete any configuration blocks for that plugin.

**Step 3**: Clean unused plugins

```powershell
.\pack-manager.ps1 clean
```

**Step 4**: Restart Neovim

---

## Migration from lazy.nvim

This configuration has been migrated from lazy.nvim to vim.pack. Here's what changed:

### Architecture Changes

**Before (lazy.nvim):**
```lua
require("lazy").setup({
  spec = {
    { "plugin", opts = {...} }
  }
})
```

**After (vim.pack):**
```lua
-- Declare plugins in lua/config/pack.lua
vim.pack.add({ "https://github.com/author/plugin" })

-- Configure separately in lua/config/plugins.lua
require("plugin").setup({...})
```

### Key Differences

| Feature | lazy.nvim | vim.pack |
|---------|-----------|----------|
| Installation | External | Built-in |
| Plugin Declaration | Inline specs | URL list |
| Configuration | Within spec | Separate file |
| UI | Fancy UI | CLI script |
| Lazy Loading | Automatic | Manual (via autocmds) |
| Version Pinning | Easy | Native `vim.version.range()` |
| Lockfile | lazy-lock.json | No lockfile |

### Benefits of vim.pack

1. ✅ **No Bootstrap**: Built into Neovim, no installation needed
2. ✅ **Simpler**: Less abstraction, clearer flow
3. ✅ **Native**: Part of core, maintained by Neovim team
4. ✅ **Fast**: Minimal overhead
5. ✅ **Stable**: Part of stable API

### Command Equivalents

| lazy.nvim | vim.pack |
|-----------|----------|
| `:Lazy` | `.\pack-manager.ps1 list` |
| `:Lazy install` | `.\pack-manager.ps1 install` |
| `:Lazy update` | `:lua vim.pack.update()` |
| `:Lazy clean` | `.\pack-manager.ps1 clean` |
| `:Lazy sync` | `.\pack-manager.ps1 install && .\pack-manager.ps1 update` |

### Files to Remove (Optional Cleanup)

After migration, these files are no longer needed:

```powershell
# Windows
Remove-Item lua\config\lazy.lua -ErrorAction SilentlyContinue
Remove-Item lazy-lock.json -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim-data\lazy -ErrorAction SilentlyContinue
```

```bash
# Linux/macOS
rm -f lua/config/lazy.lua
rm -f lazy-lock.json
rm -rf ~/.local/share/nvim/lazy
```

### Lazy Loading

lazy.nvim handles lazy loading automatically. With vim.pack, you need to implement it manually:

**lazy.nvim:**
```lua
{
  "plugin",
  event = "VeryLazy",
  cmd = "PluginCommand",
  ft = "lua",
}
```

**vim.pack:**
```lua
-- Load on event
vim.api.nvim_create_autocmd("VeryLazy", {
  callback = function()
    vim.pack.add("plugin")
    require("plugin").setup()
  end,
  once = true
})

-- Load on command
vim.api.nvim_create_user_command("PluginCommand", function()
  vim.pack.add("plugin")
  vim.cmd("PluginCommand")
end, {})

-- Load on filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.pack.add("plugin")
    require("plugin").setup()
  end,
  once = true
})
```

---

## Troubleshooting

### Plugins Not Loading

**Symptom**: Plugins don't load or "module not found" errors

**Solution**:
```powershell
# Check if plugins are installed
.\pack-manager.ps1 list

# Reinstall if needed
.\pack-manager.ps1 install

# In Neovim, check status
:lua vim.print(vim.pack.get())
```

### LSP Not Working

**Symptom**: No LSP features like hover, completion, diagnostics

**Solution**:
```vim
" Check LSP status
:LspInfo

" Check health
:checkhealth lsp

" Restart LSP
:LspRestart

" Check if LSP server is installed
:Mason
```

### Treesitter Errors

**Symptom**: Syntax highlighting broken or Treesitter errors

**Solution**:
```vim
" Update parsers
:TSUpdate

" Check health
:checkhealth nvim-treesitter

" Install specific parser
:TSInstall lua
```

### Colorscheme Not Loading

**Symptom**: Wrong colors or colorscheme error

**Solution**:
```vim
" Manually set colorscheme
:colorscheme blue-whale

" Check if plugin installed
:lua vim.print(vim.pack.get({'blue-whale.nvim'}))

" Reinstall colorscheme plugin
" (run in terminal)
.\pack-manager.ps1 install
```

### Configuration Errors

**Symptom**: Errors on startup

**Solution**:
```vim
" View error messages
:messages

" Check syntax of config files
" Edit lua/config/plugins.lua and look for errors
```

### Start Fresh

If all else fails, remove plugins and reinstall:

```powershell
# Windows
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim-data\pack
.\pack-manager.ps1 install
nvim
```

```bash
# Linux/macOS
rm -rf ~/.local/share/nvim/pack
pwsh pack-manager.ps1 install
nvim
```

### Common Issues

**Issue**: "Module 'X' not found"
- **Cause**: Plugin not installed
- **Fix**: Run `.\pack-manager.ps1 install`

**Issue**: LSP not attaching to buffer
- **Cause**: LSP server not installed or misconfigured
- **Fix**: Run `:checkhealth lsp`, install server with `:Mason`

**Issue**: Treesitter not highlighting
- **Cause**: Parser not installed
- **Fix**: Run `:TSInstall <language>`

**Issue**: Plugins not updating
- **Cause**: Git issues or network problems
- **Fix**: Check internet connection, try `.\pack-manager.ps1 update` again

### Health Checks

Run comprehensive health checks:

```vim
" Check all
:checkhealth

" Check specific subsystem
:checkhealth lsp
:checkhealth nvim-treesitter
:checkhealth provider
```

### Getting Help

1. Check `:help vim.pack` for official documentation
2. Read `:messages` for error details
3. Run `:checkhealth` to diagnose issues
4. Check plugin documentation
5. Search Neovim documentation: https://neovim.io/doc/

### Performance Issues

**Symptom**: Slow startup or lag

**Solution**:
```vim
" Check startup time
:lua vim.print(vim.fn.strftime("%T"))
" Restart and check again

" Profile startup (if available)
:StartupTime

" Identify slow plugins and consider lazy loading
" See lazy loading section above
```

### Backup & Restore

**Create backup:**
```powershell
# Windows
Copy-Item -Recurse $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup.$(Get-Date -Format 'yyyyMMdd-HHmmss')
```

```bash
# Linux/macOS
cp -r ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d-%H%M%S)
```

**Restore from backup:**
```powershell
# Windows
Remove-Item -Recurse $env:LOCALAPPDATA\nvim
Move-Item $env:LOCALAPPDATA\nvim.backup $env:LOCALAPPDATA\nvim
```

```bash
# Linux/macOS
rm -rf ~/.config/nvim
mv ~/.config/nvim.backup ~/.config/nvim
```

---

## Additional Resources

- **`:help vim.pack`** - Official vim.pack documentation
- **`:help packages`** - Package system documentation
- **`:help lua`** - Lua in Neovim
- **https://neovim.io/doc/** - Online documentation
- **https://dotfyle.com** - Plugin discovery

---

## Credits

This configuration is maintained for personal use but shared for the community.

**Made with ❤️ for the Neovim Community**

---

**Happy Vimming!** 🚀✨
