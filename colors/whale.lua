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

-- Macro recording and mode messages
set_hl("ModeMsg", { fg = palette.number, bold = true })  -- Mode messages (like --RECORDING--)
set_hl("MsgArea", { link = "Normal" })  -- Message area
set_hl("MoreMsg", { fg = palette.comment, bold = true })  -- More prompt

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
set_hl("@variable.builtin", { fg = palette.builtin_constant, bold = true })
set_hl("@variable.parameter", { fg = palette.fg, italic = true })
set_hl("@variable.member", { fg = palette.fg })

set_hl("@function", { link = "Function" })
set_hl("@function.builtin", { fg = palette.func, bold = true })
set_hl("@function.call", { fg = palette.func })
set_hl("@function.macro", { fg = palette.keyword, bold = true })
set_hl("@function.method", { fg = palette.func })
set_hl("@function.method.call", { fg = palette.func })

set_hl("@keyword", { link = "Keyword" })
set_hl("@keyword.function", { fg = palette.keyword, bold = true })
set_hl("@keyword.operator", { fg = palette.keyword, bold = true })
set_hl("@keyword.return", { fg = palette.keyword, bold = true })
set_hl("@keyword.conditional", { fg = palette.keyword, bold = true })
set_hl("@keyword.repeat", { fg = palette.keyword, bold = true })
set_hl("@keyword.import", { fg = palette.keyword, bold = true })

set_hl("@string", { link = "String" })
set_hl("@string.escape", { fg = palette.builtin_constant, bold = true })
set_hl("@string.special", { fg = palette.builtin_constant })

set_hl("@comment", { link = "Comment" })
set_hl("@type", { link = "Type" })
set_hl("@type.builtin", { fg = palette.keyword, bold = true })
set_hl("@type.definition", { fg = palette.keyword, bold = true })

set_hl("@constant", { link = "Constant" })
set_hl("@constant.builtin", { fg = palette.builtin_constant, bold = true })
set_hl("@constructor", { link = "Function" })
set_hl("@operator", { link = "Operator" })

set_hl("@property", { fg = palette.fg })
set_hl("@attribute", { fg = palette.number })
set_hl("@namespace", { fg = palette.keyword })
set_hl("@module", { fg = palette.keyword })

set_hl("@tag", { link = "htmlTag" })
set_hl("@tag.attribute", { link = "htmlArg" })
set_hl("@tag.delimiter", { fg = palette.keyword })

set_hl("@punctuation.delimiter", { fg = palette.fg })
set_hl("@punctuation.bracket", { fg = palette.fg })
set_hl("@punctuation.special", { fg = palette.fg })

set_hl("@number", { link = "Number" })
set_hl("@boolean", { link = "Boolean" })

-- LSP Semantic Tokens
set_hl("@lsp.type.class", { link = "Type" })
set_hl("@lsp.type.decorator", { fg = palette.func })
set_hl("@lsp.type.enum", { link = "Type" })
set_hl("@lsp.type.enumMember", { fg = palette.builtin_constant })
set_hl("@lsp.type.function", { link = "Function" })
set_hl("@lsp.type.interface", { link = "Type" })
set_hl("@lsp.type.macro", { fg = palette.keyword, bold = true })
set_hl("@lsp.type.method", { link = "Function" })
set_hl("@lsp.type.namespace", { fg = palette.keyword })
set_hl("@lsp.type.parameter", { fg = palette.fg, italic = true })
set_hl("@lsp.type.property", { fg = palette.fg })
set_hl("@lsp.type.struct", { link = "Type" })
set_hl("@lsp.type.type", { link = "Type" })
set_hl("@lsp.type.typeParameter", { link = "Type" })
set_hl("@lsp.type.variable", { link = "Identifier" })

-- LSP 语义修饰符
set_hl("@lsp.mod.readonly", { fg = palette.builtin_constant })
set_hl("@lsp.mod.deprecated", { strikethrough = true, fg = palette.comment })
set_hl("@lsp.mod.defaultLibrary", { fg = palette.builtin_constant })

-- Diagnostic highlights
set_hl("DiagnosticError", { fg = palette.number })
set_hl("DiagnosticWarn", { fg = palette.string })
set_hl("DiagnosticInfo", { fg = palette.keyword })
set_hl("DiagnosticHint", { fg = palette.comment })

set_hl("DiagnosticUnderlineError", { undercurl = true, sp = palette.number })
set_hl("DiagnosticUnderlineWarn", { undercurl = true, sp = palette.string })
set_hl("DiagnosticUnderlineInfo", { undercurl = true, sp = palette.keyword })
set_hl("DiagnosticUnderlineHint", { undercurl = true, sp = palette.comment })

-- Git signs
set_hl("GitSignsAdd", { fg = palette.comment })
set_hl("GitSignsChange", { fg = palette.string })
set_hl("GitSignsDelete", { fg = palette.number })

-- 确保没有使用青色或荧光绿
set_hl("SpecialKey", { fg = palette.invisibles })
set_hl("NonText", { fg = palette.invisibles })
set_hl("Whitespace", { fg = palette.invisibles })

-- NvimTree specific highlights
set_hl("NvimTreeNormal", { link = "Normal" })
set_hl("NvimTreeRootFolder", { fg = palette.keyword, bold = true })
set_hl("NvimTreeFolderName", { fg = palette.keyword })
set_hl("NvimTreeFolderIcon", { fg = palette.keyword })  -- Override default blue #8094b4
set_hl("NvimTreeOpenedFolderName", { fg = palette.keyword, bold = true })
set_hl("NvimTreeEmptyFolderName", { fg = palette.keyword })
set_hl("NvimTreeSymlink", { fg = palette.func })
set_hl("NvimTreeExecFile", { fg = palette.func, bold = true })
set_hl("NvimTreeImageFile", { fg = palette.func })
set_hl("NvimTreeSpecialFile", { fg = palette.func, underline = true })
set_hl("NvimTreeFileIcon", { link = "Normal" })

-- NvimTree Git status (避免使用Statement link的绿色)
set_hl("NvimTreeGitDirty", { fg = palette.string })  -- Modified: orange
set_hl("NvimTreeGitDirtyIcon", { fg = palette.string })
set_hl("NvimTreeGitStaged", { fg = palette.comment })  -- Staged: green
set_hl("NvimTreeGitStagedIcon", { fg = palette.comment })
set_hl("NvimTreeGitMerge", { fg = palette.func })  -- Merge: magenta
set_hl("NvimTreeGitMergeIcon", { fg = palette.func })
set_hl("NvimTreeGitRenamed", { fg = palette.css_pseudo })  -- Renamed: orange
set_hl("NvimTreeGitRenamedIcon", { fg = palette.css_pseudo })
set_hl("NvimTreeGitNew", { fg = palette.comment })  -- New: green
set_hl("NvimTreeGitNewIcon", { fg = palette.comment })
set_hl("NvimTreeGitDeleted", { fg = palette.number })  -- Deleted: red
set_hl("NvimTreeGitDeletedIcon", { fg = palette.number })
set_hl("NvimTreeGitIgnored", { fg = palette.invisibles })
set_hl("NvimTreeGitIgnoredIcon", { fg = palette.invisibles })

-- NvimTree Git folder status
set_hl("NvimTreeGitDirtyFolderHL", { fg = palette.string })
set_hl("NvimTreeGitStagedFolderHL", { fg = palette.comment })
set_hl("NvimTreeGitMergeFolderHL", { fg = palette.func })
set_hl("NvimTreeGitRenamedFolderHL", { fg = palette.css_pseudo })
set_hl("NvimTreeGitNewFolderHL", { fg = palette.comment })
set_hl("NvimTreeGitDeletedFolderHL", { fg = palette.number })
set_hl("NvimTreeGitIgnoredFolderHL", { fg = palette.invisibles })

-- NvimTree Diagnostic highlights
set_hl("NvimTreeLspDiagnosticsError", { fg = palette.number })
set_hl("NvimTreeLspDiagnosticsErrorIcon", { fg = palette.number })
set_hl("NvimTreeLspDiagnosticsWarning", { fg = palette.string })
set_hl("NvimTreeLspDiagnosticsWarningIcon", { fg = palette.string })
set_hl("NvimTreeLspDiagnosticsInformation", { fg = palette.keyword })
set_hl("NvimTreeLspDiagnosticsInformationIcon", { fg = palette.keyword })
set_hl("NvimTreeLspDiagnosticsHint", { fg = palette.comment })
set_hl("NvimTreeLspDiagnosticsHintIcon", { fg = palette.comment })

set_hl("NvimTreeDiagnosticErrorFileHL", { fg = palette.number })
set_hl("NvimTreeDiagnosticWarnFileHL", { fg = palette.string })
set_hl("NvimTreeDiagnosticInfoFileHL", { fg = palette.keyword })
set_hl("NvimTreeDiagnosticHintFileHL", { fg = palette.comment })

set_hl("NvimTreeDiagnosticErrorFolderHL", { fg = palette.number })
set_hl("NvimTreeDiagnosticWarnFolderHL", { fg = palette.string })
set_hl("NvimTreeDiagnosticInfoFolderHL", { fg = palette.keyword })
set_hl("NvimTreeDiagnosticHintFolderHL", { fg = palette.comment })

-- NvimTree Decorators
set_hl("NvimTreeModifiedIcon", { fg = palette.string })
set_hl("NvimTreeModifiedFileHL", { fg = palette.string })
set_hl("NvimTreeModifiedFolderHL", { fg = palette.string })
set_hl("NvimTreeOpenedHL", { fg = palette.keyword, bold = true })
set_hl("NvimTreeOpenedFolderIcon", { fg = palette.keyword, bold = true })
set_hl("NvimTreeHiddenIcon", { fg = palette.invisibles })
set_hl("NvimTreeHiddenFileHL", { fg = palette.invisibles })
set_hl("NvimTreeHiddenFolderHL", { fg = palette.invisibles })
set_hl("NvimTreeBookmarkIcon", { fg = palette.func })
set_hl("NvimTreeBookmarkHL", { fg = palette.func })
set_hl("NvimTreeCopiedHL", { fg = palette.css_pseudo })
set_hl("NvimTreeCutHL", { fg = palette.number })

-- NvimTree Window picker
set_hl("NvimTreeWindowPicker", { fg = palette.bg, bg = palette.keyword, bold = true })
set_hl("NvimTreeCursorLine", { bg = palette.line_highlight })
set_hl("NvimTreeIndentMarker", { fg = palette.invisibles })

-- Oil.nvim highlights
set_hl("OilDir", { fg = palette.keyword })
set_hl("OilDirHidden", { fg = palette.invisibles })
set_hl("OilDirIcon", { fg = palette.keyword })  -- Directory icon
set_hl("OilFile", { link = "Normal" })
set_hl("OilFileHidden", { fg = palette.invisibles })
set_hl("OilSocket", { fg = palette.func })
set_hl("OilSocketHidden", { fg = palette.invisibles })
set_hl("OilLink", { fg = palette.func })
set_hl("OilLinkHidden", { fg = palette.invisibles })
set_hl("OilOrphanLink", { fg = palette.number })
set_hl("OilOrphanLinkHidden", { fg = palette.invisibles })
set_hl("OilLinkTarget", { fg = palette.func, italic = true })
set_hl("OilOrphanLinkTarget", { fg = palette.number, italic = true })
set_hl("OilLinkTargetHidden", { fg = palette.invisibles, italic = true })
set_hl("OilOrphanLinkTargetHidden", { fg = palette.invisibles, italic = true })

-- Oil preview window actions
set_hl("OilCreate", { fg = palette.comment })  -- Create: green
set_hl("OilDelete", { fg = palette.number })  -- Delete: red
set_hl("OilMove", { fg = palette.string })  -- Move: orange
set_hl("OilCopy", { fg = palette.keyword })  -- Copy: blue
set_hl("OilChange", { fg = palette.func })  -- Change: magenta
set_hl("OilRestore", { fg = palette.comment })  -- Restore: green
set_hl("OilPurge", { fg = palette.number })  -- Purge: red
set_hl("OilTrash", { fg = palette.number })  -- Trash: red
set_hl("OilTrashSourcePath", { fg = palette.comment, italic = true })
set_hl("OilEmpty", { fg = palette.invisibles })
set_hl("OilHidden", { fg = palette.invisibles })

-- Standard directory highlight (used by both)
set_hl("Directory", { fg = palette.keyword })
