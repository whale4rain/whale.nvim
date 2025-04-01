local components = require("plugins.config.heirline.components")
return { -- statusline
	components.RightPadding(components.Mode, 2),
	components.RightPadding(components.FileNameBlock, 2),
	components.RightPadding(components.Git, 2),
	components.RightPadding(components.Diagnostics),
	components.RightPadding(components.SearchCount),
	components.Fill,
	components.MacroRec,
	components.Fill, -- 对齐
	components.RightPadding(components.WorkDir),
	components.RightPadding(components.LSPActive),
	components.RightPadding(components.FileType, 0),
	components.RightPadding(components.Ruler),
	components.ScrollBar,
}
