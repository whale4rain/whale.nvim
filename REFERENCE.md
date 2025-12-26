# Quick Reference Card

**Essential commands and information for vim.pack Neovim configuration**

---

## Plugin Management Commands

### CLI (PowerShell)

```powershell
.\pack-manager.ps1 install    # Install all plugins
.\pack-manager.ps1 update     # Update all plugins
.\pack-manager.ps1 list       # List plugin status
.\pack-manager.ps1 clean      # Remove unused plugins
```

### In Neovim

```vim
:lua vim.pack.update()                      " Update all plugins
:lua vim.pack.update({ 'plugin1' })        " Update specific plugin
:lua vim.print(vim.pack.get())             " Get plugin info
:lua vim.pack.del({ 'plugin1' })           " Remove plugin
```

---

## File Locations

### Windows
```
Config:  %LOCALAPPDATA%\nvim
Data:    %LOCALAPPDATA%\nvim-data
Plugins: %LOCALAPPDATA%\nvim-data\pack\plugins\start
```

### Linux/macOS
```
Config:  ~/.config/nvim
Data:    ~/.local/share/nvim
Plugins: ~/.local/share/nvim/pack/plugins/start
```

---

## Configuration Files

| File | Purpose | Edit? |
|------|---------|-------|
| `init.lua` | Entry point | Rarely |
| `lua/config/options.lua` | Neovim settings | ✅ Yes |
| `lua/config/keymaps.lua` | Key bindings | ✅ Yes |
| `lua/config/pack.lua` | **Plugin declarations** | ✅ **Main** |
| `lua/config/plugins.lua` | **Plugin setup** | ✅ **Main** |
| `lua/config/colorscheme.lua` | Color scheme | ✅ Yes |

---

## Key Bindings

**Leader**: `Space`

### File Navigation
| Key | Action |
|-----|--------|
| `<leader>ee` | Toggle file explorer (nvim-tree) |
| `<leader>ef` | Focus file explorer |
| `-` | Open Oil file manager |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep (Telescope) |
| `<leader>fb` | Browse buffers (Telescope) |
| `<leader>fh` | Help tags (Telescope) |

### LSP
| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>rs` | Restart LSP |
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `<leader>d` | Show diagnostics |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

### Git
| Key | Action |
|-----|--------|
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff this |
| `]h` | Next hunk |
| `[h` | Previous hunk |

### Navigation
| Key | Action |
|-----|--------|
| `s` | Flash jump |
| `S` | Flash treesitter |
| `Ctrl+h/j/k/l` | Window navigation |
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |

### Terminal
| Key | Action |
|-----|--------|
| `<leader>th` | Horizontal terminal |
| `<leader>tv` | Vertical terminal |
| `<leader>tf` | Floating terminal |
| `Ctrl+\` | Toggle terminal |

### Editing
| Key | Action |
|-----|--------|
| `<Tab>` | Accept completion |
| `Ctrl+n/p` | Navigate completions |
| `ys{motion}{char}` | Add surround |
| `ds{char}` | Delete surround |
| `cs{old}{new}` | Change surround |

### Diagnostics
| Key | Action |
|-----|--------|
| `<leader>xw` | Workspace diagnostics (Trouble) |
| `<leader>xd` | Document diagnostics |
| `<leader>xq` | Quickfix list |
| `<leader>xl` | Location list |

---

## Adding a Plugin (Quick Steps)

### 1. Declare
Edit `lua/config/pack.lua`:
```lua
{ "author/plugin-name" },
```

### 2. Install
```powershell
.\pack-manager.ps1 install
```

### 3. Configure
Edit `lua/config/plugins.lua`:
```lua
safe_setup("plugin-name", function(plugin)
  plugin.setup({ })
end)
```

### 4. Restart
```powershell
nvim
```

---

## Removing a Plugin

1. Remove from `lua/config/pack.lua`
2. Remove config from `lua/config/plugins.lua`
3. Run: `.\pack-manager.ps1 clean`
4. Restart Neovim

---

## Health Checks

```vim
:checkhealth                    " Check all
:checkhealth lsp                " Check LSP
:checkhealth nvim-treesitter    " Check Treesitter
:messages                       " View messages
:LspInfo                        " LSP status
:TSInstallInfo                  " Treesitter info
```

---

## Troubleshooting Quick Fixes

### Plugins not loading
```powershell
.\pack-manager.ps1 list     # Check status
.\pack-manager.ps1 install  # Reinstall
```
```vim
:lua vim.print(vim.pack.get())
```

### LSP not working
```vim
:checkhealth lsp
:LspInfo
:LspRestart
:Mason                      " Install LSP servers
```

### Treesitter issues
```vim
:TSUpdate
:TSInstall <language>
:checkhealth nvim-treesitter
```

### Configuration errors
```vim
:messages                   " View errors
```

### Start fresh
```powershell
# Windows
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim-data\pack
.\pack-manager.ps1 install
```
```bash
# Linux/macOS
rm -rf ~/.local/share/nvim/pack
pwsh pack-manager.ps1 install
```

---

## vim.pack API Reference

```lua
-- Add plugins
vim.pack.add({
  "https://github.com/author/plugin"
})

-- Update plugins
vim.pack.update()                    -- All
vim.pack.update({ "name" })         -- Specific

-- Get info
vim.pack.get()                       -- All
vim.pack.get({ "name" })            -- Specific

-- Remove
vim.pack.del({ "name" })

-- Version constraints
vim.pack.add({
  "url",
  version = vim.version.range("1.0.0")
})
```

---

## Lazy Loading Patterns

### On Event
```lua
vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function()
    vim.pack.add("plugin")
    require("plugin").setup()
  end,
  once = true
})
```

### On Command
```lua
vim.api.nvim_create_user_command("PluginCmd", function()
  vim.pack.add("plugin")
  vim.cmd("PluginCmd")
end, {})
```

### On Filetype
```lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.pack.add("python-plugin")
    require("python-plugin").setup()
  end,
  once = true
})
```

---

## Common Neovim Commands

```vim
:w                    " Save
:q                    " Quit
:wq                   " Save and quit
:e <file>             " Edit file
:bd                   " Close buffer
:bn / :bp             " Next/previous buffer
:vsplit / :split      " Split window
:set <option>         " Set option
:help <topic>         " Help
```

---

## Installation Quick Start

### 1. Install
```powershell
# Windows
git clone https://github.com/whale4rain/whale.nvim.git $env:LOCALAPPDATA\nvim
cd $env:LOCALAPPDATA\nvim
.\pack-manager.ps1 install
nvim
```

### 2. Verify
```vim
:checkhealth
:lua vim.print(vim.pack.get())
```

### 3. Test Features
- LSP: `:LspInfo`
- Treesitter: `:TSInstallInfo`
- File explorer: `<leader>ee`
- Find files: `<leader>ff`

---

## Performance Tips

1. **Lazy Load**: Use autocmds for non-essential plugins
2. **Minimal Startup**: Only load core plugins at start
3. **Profile**: Check slow plugins with `:StartupTime`
4. **Clean**: Run `.\pack-manager.ps1 clean` regularly

---

## Backup & Restore

### Backup
```powershell
# Windows
Copy-Item -Recurse $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup
```
```bash
# Linux/macOS
cp -r ~/.config/nvim ~/.config/nvim.backup
```

### Restore
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

## lazy.nvim → vim.pack Migration

| lazy.nvim | vim.pack |
|-----------|----------|
| `:Lazy` | `.\pack-manager.ps1 list` |
| `:Lazy install` | `.\pack-manager.ps1 install` |
| `:Lazy update` | `:lua vim.pack.update()` |
| `:Lazy clean` | `.\pack-manager.ps1 clean` |
| `:Lazy sync` | Install then update |

---

## LSP Servers Configured

- **clangd** - C/C++
- **rust_analyzer** - Rust
- **lua_ls** - Lua
- **ruff** - Python
- **gopls** - Go

Install more with `:Mason`

---

## Treesitter Languages

Configured: go, c, cpp, lua, vim, vimdoc, query, python, rust, javascript, html, regex

Install more: `:TSInstall <language>`

---

## Formatters

- **stylua** - Lua
- **prettier** - JS/TS/JSON/YAML/Markdown
- **clang-format** - C/C++
- **black/isort** - Python
- **gofmt** - Go

---

## Included Plugins (50+)

**Core**: plenary, nvim-web-devicons, nui  
**LSP**: lspconfig, mason, blink.cmp  
**Syntax**: treesitter  
**Files**: nvim-tree, oil, telescope  
**Git**: gitsigns, diffview  
**UI**: lualine, barbar, incline, snacks  
**Edit**: surround, flash, mini.pairs  
**Tools**: which-key, marks, trouble  
**AI**: supermaven, copilot  

---

## Resources

- `:help vim.pack` - Official docs
- `:help packages` - Package system
- `GUIDE.md` - Full documentation
- https://neovim.io/doc/ - Online docs
- https://dotfyle.com - Plugin discovery

---

## Help Commands

```vim
:help                 " General help
:help vim.pack        " vim.pack docs
:help lsp             " LSP help
:help telescope       " Plugin help
:help <keyword>       " Search help
```

---

## Quick Workflow

### Morning
```powershell
.\pack-manager.ps1 update
nvim
```

### Daily Use
- Edit files
- Use LSP features
- Git integration
- Terminal

### End of Day
```bash
git add .
git commit -m "Update"
```

---

**Print this card and keep it handy!** 📄✨

**Made with ❤️ for Neovim**
