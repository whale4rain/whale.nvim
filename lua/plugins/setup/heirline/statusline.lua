local components = require("plugins.setup.heirline.components")
return { -- statusline
	{ components.RightPadding(components.Mode, 0), flexible = 100 },
	{
		components.RightPadding(components.FileNameBlock, 0),
		-- components.RightPadding(components.FileDetails),
		components.RightPadding(components.Git),
		components.RightPadding(components.Diagnostics, 2),
		components.RightPadding(components.Spell),
	},
	{
		components.Fill,
		components.MacroRec,
		components.Fill, -- 对齐
	},
	{
		-- components.RightPadding(components.WorkDir),
		components.RightPadding(components.LSPActive),
		components.RightPadding(components.Ruler),
		components.RightPadding(components.FileType, 1),
		components.ScrollBar,
	},
}
