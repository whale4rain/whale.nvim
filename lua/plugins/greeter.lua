return {
    "goolord/alpha-nvim",
    requires = { 'echasnovski/mini.icons' },
    config = function ()
        local alpha = require'alpha'
        local startify = require'alpha.themes.startify'
        startify.section.header.val = {
            [[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
            [[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
            [[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
            [[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
            [[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
            [[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
            [[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
            [[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
            [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
            [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
            [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
        }
        startify.section.top_buttons.val = {
            startify.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
        }
        -- disable MRU
        startify.section.mru.val = { { type = "padding", val = 0 } }
        -- disable MRU cwd
        startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
        -- disable file_icons
        startify.file_icons.enabled = false
        -- startify.file_icons.highlight = false
        -- startify.file_icons.highlight = 'Keyword'
        --
        startify.section.bottom_buttons.val = {
            startify.button( "q", "󰅚  Quit NVIM" , ":qa<CR>"),
        }
        startify.section.footer.val = {
            { type = "text", val = "footer" },
        }
        -- ignore filetypes in MRU

        startify.mru_opts.ignore = function(path, ext)
            return
                    (string.find(path, "COMMIT_EDITMSG"))
                or  (vim.tbl_contains(default_mru_ignore, ext))
        end
        alpha.setup(startify.config)
    end
}