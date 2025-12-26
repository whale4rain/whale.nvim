-- Load core configuration
require("config.options")
require("config.keymaps")

-- Load native vim.pack package manager
require("config.pack")

-- Load and configure all plugins
require("config.plugins").load_configs()
