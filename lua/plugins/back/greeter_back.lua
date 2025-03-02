return {
    "goolord/alpha-nvim",
    requires = { "nvim-tree/nvim-web-devicons" }, -- 如果需要文件图标
    config = function()
        local alpha = require("alpha")
        local startify = require("alpha.themes.startify")
        
        -- 自定义 header（可选）
        local headers = {
            {
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
      
            {
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
      
            {
              [[             ,  ,, ,]],
              [[       , ,; ; ;;  ; ;  ;]],
              [[    , ; ';  ;  ;; .-''\ ; ;]],
              [[ , ;  ;`  ; ,; . / /8b \ ; ;]],
              [[ `; ; .;'         ;,\8 |  ;  ;]],
              [[  ` ;/   / `_      ; ;;    ;  ; ;]],
              [[     |/.'  /9)    ;  ; `    ;  ; ;]],
              [[    ,/'          ; ; ;  ;   ; ; ; ;]],
              [[   /_            ;    ;  `    ;  ;]],
              [[  `?8P"  .      ;  ; ; ; ;     ;  ;]],
              [[  | ;  .:: `     ;; ; ;   `  ;  ;]],
              [[  `' `--._      ;;  ;;  ; ;   ;   ;]],
              [[   `-..__..--''   ; ;    ;;   ; ;   ;]],
              [[               ;    ; ; ;   ;     ;      Felix Lee <flee@cse.psu.edu>]],
            },
          }
          
          local function random_header()
            return headers[math.random(#headers)]
          end
          
          startify.section.header.val = random_header()
        --startify.section.header.opts = { position = "center" }
        -- 配置 sections（保留最近文件 + 添加按钮）
        startify.section.top_buttons.val = {
            --{ type = "text", val = "⚡ Quick Actions" },
            { type = "padding", val = 1 , opts = { position = "center" } },
            startify.button("e", "New File", ":ene <BAR> startinsert<CR>"),
            startify.button("f", "Find File", ":Telescope find_files<CR>"),
            startify.button("g", "Find Word", ":Telescope live_grep<CR>"),
            startify.button("c", "Configuration", ":e $MYVIMRC<CR>"),
            startify.button("u", "Update Plugins", "<cmd>Lazy sync<CR>"),
            startify.button("q", "Quit NVIM", ":qa<CR>"),
        }
        startify.section.footer.val = {
            { type = "text", val = "end or not" },
        }
        -- 调整 section 顺序（可选）
        startify.config.layout = {
            { type = "padding", val = 1},
            startify.section.header,
            { type = "padding", val = 1 },
            startify.section.top_buttons,
            { type = "padding", val = 1 },
            startify.section.mru_cwd,
            startify.section.mru,
            { type = "padding", val = 1 },
            startify.section.footer,
        }
        
        -- 设置配置
        alpha.setup(startify.config)
        
        -- 自动显示 Alpha 当没有打开的文件时
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                vim.cmd [[
                    set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
                ]]
            end,
        })
    end,
  }
  