-- colors/whale.lua

-- 1. Standard setup: Clear existing highlights and syntax
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") ~= 0 then
    vim.cmd("syntax reset")
end

-- 2. Set the theme name
vim.g.colors_name = "whale"

-- 3. Define your palette based on 'example' file
local palette = {
    bg = "#F7F9FF",
    fg = "#000000",
    caret = "#000000",
    invisibles = "#CCCCCC",
    line_highlight = "#E8E8FF",
    selection = "#C0C0C0",
    
    comment = "#008000",
    string = "#E68C32",
    number = "#FF0000",
    builtin_constant = "#000080",
    keyword = "#0000FF",
    html_string = "#8000FF",
    css_id = "#0080FF",
    css_pseudo = "#FF8000",
    css_prop = "#8080C0",
    func = "#FF00FF",
}

-- 4. Define highlight groups
local hl = vim.api.nvim_set_hl

-- Utility to make setting groups easier
local function set_hl(group, opts)
    hl(0, group, opts)
end

-- UI Highlights
set_hl("Normal", { fg = palette.fg, bg = palette.bg })
set_hl("NormalFloat", { fg = palette.fg, bg = palette.bg }) -- Using main bg for now
set_hl("Cursor", { fg = palette.bg, bg = palette.caret })
set_hl("LineNr", { fg = palette.invisibles })
set_hl("CursorLine", { bg = palette.line_highlight })
set_hl("CursorLineNr", { fg = palette.keyword, bold = true })
set_hl("Visual", { bg = palette.selection })
set_hl("Search", { fg = palette.bg, bg = palette.css_id }) -- Arbitrary choice for search
set_hl("Pmenu", { fg = palette.fg, bg = palette.line_highlight })
set_hl("PmenuSel", { fg = palette.bg, bg = palette.keyword })
set_hl("VertSplit", { fg = palette.invisibles })
set_hl("WinSeparator", { fg = palette.invisibles })

-- Syntax Highlights
set_hl("Comment", { fg = palette.comment })
set_hl("String", { fg = palette.string })
set_hl("Character", { fg = palette.string })
set_hl("Number", { fg = palette.number })
set_hl("Boolean", { fg = palette.builtin_constant, bold = true })
set_hl("Float", { fg = palette.number })

set_hl("Constant", { fg = palette.builtin_constant, italic = true })
set_hl("Identifier", { fg = palette.fg }) -- Variable
set_hl("Function", { fg = palette.func })

set_hl("Statement", { fg = palette.keyword, bold = true }) -- Keyword
set_hl("Conditional", { fg = palette.keyword, bold = true })
set_hl("Repeat", { fg = palette.keyword, bold = true })
set_hl("Label", { fg = palette.keyword, bold = true })
set_hl("Operator", { fg = palette.fg }) -- Operator (default black)
set_hl("Keyword", { fg = palette.keyword, bold = true })
set_hl("Exception", { fg = palette.keyword, bold = true })

set_hl("PreProc", { fg = palette.keyword, bold = true })
set_hl("Include", { fg = palette.keyword, bold = true })
set_hl("Define", { fg = palette.keyword, bold = true })
set_hl("Macro", { fg = palette.keyword, bold = true })

set_hl("Type", { fg = palette.keyword, bold = true }) -- Storage type
set_hl("StorageClass", { fg = palette.keyword, bold = true })
set_hl("Structure", { fg = palette.keyword, bold = true })
set_hl("Typedef", { fg = palette.keyword, bold = true })

set_hl("Special", { fg = palette.builtin_constant })
set_hl("SpecialChar", { fg = palette.builtin_constant })
set_hl("Tag", { fg = palette.keyword })
set_hl("Delimiter", { fg = palette.fg })
set_hl("SpecialComment", { fg = palette.comment })
set_hl("Debug", { fg = palette.number })

set_hl("Underlined", { underline = true })
set_hl("Ignore", { fg = palette.invisibles })
set_hl("Error", { fg = palette.number, bold = true })
set_hl("Todo", { fg = palette.bg, bg = palette.comment, bold = true })

-- HTML Specifics (approximate mapping)
set_hl("htmlTag", { fg = palette.keyword })
set_hl("htmlArg", { fg = palette.number }) -- HTML attribute -> Red
set_hl("htmlString", { fg = palette.html_string }) -- HTML string -> Purple

-- CSS Specifics
set_hl("cssClassName", { fg = palette.number }) -- CSS class -> Red
set_hl("cssIdentifier", { fg = palette.css_id, bold = true }) -- CSS ID -> Blue bold
set_hl("cssPseudoClassId", { fg = palette.css_pseudo, bold = true }) -- CSS pseudo element -> Orange bold
set_hl("cssProp", { fg = palette.css_prop, bold = true }) -- CSS property -> Light Blue bold
set_hl("cssValue", { fg = palette.fg, bold = true }) -- CSS value -> Black bold
set_hl("cssImportant", { fg = palette.number, bold = true }) -- CSS important -> Red bold

-- Treesitter standard groups (linking to standard groups)
set_hl("@variable", { link = "Identifier" })
set_hl("@function", { link = "Function" })
set_hl("@keyword", { link = "Keyword" })
set_hl("@string", { link = "String" })
set_hl("@comment", { link = "Comment" })
set_hl("@type", { link = "Type" })
set_hl("@constant", { link = "Constant" })
set_hl("@constructor", { link = "Function" })
set_hl("@operator", { link = "Operator" })
set_hl("@tag", { link = "htmlTag" })
set_hl("@tag.attribute", { link = "htmlArg" })
set_hl("@property", { link = "cssProp" }) -- CSS property often maps here in TS
