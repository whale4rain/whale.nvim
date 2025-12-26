# Configuration Structure

Your Neovim configuration has been restructured to use modular plugin files.

## Structure

```
nvim/
├── init.lua                      # Entry point - loads all plugins
├── lua/
│   ├── config/
│   │   ├── options.lua          # Neovim settings
│   │   ├── keymaps.lua          # Global key mappings
│   │   └── lsp.lua              # LSP, formatting, linting setup
│   └── plugins/                  # Individual plugin configurations
│       ├── core.lua             # Core dependencies (plenary, nui)
│       ├── colorscheme.lua      # Colorschemes
│       ├── nvim-treesitter.lua  # Syntax highlighting
│       ├── blinkcmp.lua         # Completion
│       ├── nvim-tree.lua        # File explorer
│       ├── oil.lua              # File manager
│       ├── gitsigns.lua         # Git integration
│       ├── statusline.lua       # Status line (lualine)
│       ├── buffer.lua           # Buffer tabs (barbar)
│       ├── snack.lua            # Snacks.nvim (picker, etc)
│       ├── flash.lua            # Navigation
│       ├── surround.lua         # Surround operations
│       ├── autopairs.lua        # Auto pairs & tabout
│       ├── mark.lua             # Marks
│       ├── trouble.lua          # Diagnostics viewer
│       ├── ufo.lua              # Folding
│       ├── toggleterm.lua       # Terminal
│       ├── incline.lua          # Floating statuslines
│       ├── modes.lua            # Mode highlights
│       ├── comfy-line-number.lua # Line numbers
│       ├── session.lua          # Session management
│       ├── indent.lua           # Indent guides
│       ├── indent-autosetup.lua # Auto indent detection
│       ├── ai.lua               # Supermaven AI
│       ├── copilot.lua          # GitHub Copilot
│       ├── go.lua               # Go support
│       ├── diffview.lua         # Git diff viewer
│       ├── grup-far.lua         # Search and replace
│       ├── render-markdown.lua  # Markdown rendering
│       ├── image.lua            # Image support
│       ├── leetcode.lua         # LeetCode integration
│       ├── diagnostic.lua       # Inline diagnostics
│       ├── whitespace.lua       # Whitespace management
│       └── which-key.lua        # Key hints (mini.clue)
├── GUIDE.md                      # Comprehensive guide
└── REFERENCE.md                  # Quick reference
```

## Plugin File Format

Each plugin file follows this pattern:

```lua
-- Declare plugin(s)
vim.pack.add({
    "https://github.com/author/plugin",
})

-- Setup plugin
require("plugin").setup({
    -- configuration options
})

-- Add keymaps (if needed)
vim.keymap.set("n", "<leader>key", function()
    -- action
end, { desc = "Description" })
```

## How It Works

1. **init.lua** requires each plugin file in order
2. Each plugin file calls `vim.pack.add()` to declare the plugin
3. vim.pack automatically clones and loads the plugin
4. The plugin is then configured immediately after

## Adding a New Plugin

1. Create `lua/plugins/my-plugin.lua`:
   ```lua
   vim.pack.add({
       "https://github.com/author/my-plugin",
   })
   
   require("my-plugin").setup({})
   ```

2. Add to `init.lua`:
   ```lua
   require("plugins.my-plugin")
   ```

3. Restart Neovim

## Removing a Plugin

1. Remove the require line from `init.lua`
2. Delete `lua/plugins/plugin-name.lua`
3. Restart Neovim

## Benefits

- ✅ **Modular**: Each plugin in its own file
- ✅ **Clear**: Easy to see what each plugin does
- ✅ **Simple**: No complex package manager needed
- ✅ **Fast**: Native vim.pack is built into Neovim
- ✅ **Maintainable**: Easy to add/remove plugins

## Migration Complete!

Your configuration is now using the new modular structure. All plugins have been converted from the centralized `config/plugins.lua` format to individual files.
