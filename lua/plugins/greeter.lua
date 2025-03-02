return {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
  
      -- 多个 ASCII 头图
      local headers = {
        {
            [[  ]],
          [[  ]],[[  ]],[[  ]],
          [[                               __                ]],
          [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
          [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
          [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
          [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
          [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        },
  
        {
            [[  ]],
            [[  ]],[[  ]],[[  ]],
          [[                                       /;    ;\]],
          [[                                   __  \\____//]],
          [[                                  /{_\_/   `'\____]],
          [[                                  \___   (o)  (o  }]],
          [[       _____________________________/          :--'   DRINKA]],
          [[   ,-,'`@@@@@@@@       @@@@@@         \_    `__\]],
          [[  ;:(  @@@@@@@@@        @@@             \___(o'o)]],
          [[  :: )  @@@@          @@@@@@        ,'@@(  `===='        PINTA]],
          [[  :: : @@@@@:          @@@@         `@@@:]],
          [[  :: \  @@@@@:       @@@@@@@)    (  '@@@']],
          [[  ;; /\      /`,    @@@@@@@@@\   :@@@@@)                   MILKA]],
          [[  ::/  )    {_----------------:  :~`,~~;]],
          [[ ;;'`; :   )                  :  / `; ;]],
          [[;;;; : :   ;                  :  ;  ; :                        DAY !!!]],
          [[`'`' / :  :                   :  :  : :]],
          [[    )_ \__;      ";"          :_ ;  \_\       `,',']],
          [[    :__\  \    * `,'*         \  \  :  \   *  8`;'*  *]],
          [[        `^'     \ :/           `^'  `-^-'   \v/ :  \/   -Bill Ames-]],
        },
        {[[  ]],[[  ]],[[  ]],[[  ]],
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
          },

      }
  
      -- 随机选择一个头图
      local function random_header()
        return headers[math.random(#headers)]
      end
  
      -- 设置头图
      dashboard.section.header.val = random_header()
  
      -- 设置按钮
      dashboard.section.buttons.val = {
        dashboard.button("e", "󰈔  New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "󰈞  Find File", ":Telescope find_files<CR>"),
        dashboard.button("r", "↻  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button(
            "c",
            "  Open Config",
            ":lua require('telescope.builtin').find_files({ cwd = 'C:/Users/86152/AppData/Local/nvim' })<CR>"
          ),
        dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
        dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
      }
  
      -- 设置页脚（随机名言）
      local handle = io.popen("fortune")
      local fortune = handle:read("*a")
      handle:close()
      dashboard.section.footer.val = fortune
  
      -- 配置选项
      dashboard.config.opts.noautocmd = true
  
      -- 自动命令
      vim.cmd([[autocmd User AlphaReady echo 'ready']])
  
      -- 应用配置
      alpha.setup(dashboard.config)
    end,
  }
  