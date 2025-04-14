local components = require("plugins.setup.heirline.components")
return { -- statusline
	components.RightPadding(components.Mode),

	components.RightPadding(components.FileNameBlock),
	components.RightPadding(components.Git),
	components.RightPadding(components.Diagnostics),
	--components.RightPadding(components.FileDetails),
	--components.RightPadding(components.Spell),

	components.Fill,
	components.MacroRec,
	components.Fill, -- 对齐

	-- components.RightPadding(components.WorkDir),
	components.RightPadding(components.LSPActive),
	components.RightPadding(components.Ruler),
	components.RightPadding(components.FileType),
	components.ScrollBar,
}
