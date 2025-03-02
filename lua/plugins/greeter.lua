return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- 多个 ASCII 头图
		local headers = {

			{
				[[  ]],
				[[  ]],
				[[  ]],
				[[  ]],
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
				[[  ]],
				[[  ]],
				[[  ]],
				[[  ]],
				[[          )]],
				[[    )   (    )]],
				[[  (           (]],
				[[     _.---._]],
				[[ .-'/\_/\  ~~`-. _.------------.]],
				[[(  ( "v" )  ~ ~ )-.___________.']],
				[[|`-._  ~ ~  _.-'|]],
				[[|    `"""""'    |]],
				[[|               |]],
				[[|               |]],
				[[ `-._       _.-'    VK]],
				[[     `"""""']],
			},
			{
				[[  ]],
				[[  ]],
				[[  ]],
				[[  ]],
				[[                             /T /I]],
				[[                              / |/ | .-~/]],
				[[                          T\ Y  I  |/  /  _]],
				[[         /T               | \I  |  I  Y.-~/]],
				[[        I l   /I       T\ |  |  l  |  T  /]],
				[[     T\ |  \ Y l  /T   | \I  l   \ `  l Y]],
				[[ __  | \l   \l  \I l __l  l   \   `  _. |]],
				[[ \ ~-l  `\   `\  \  \\ ~\  \   `. .-~   |]],
				[[  \   ~-. "-.  `  \  ^._ ^. "-.  /  \   |]],
				[[.--~-._  ~-  `  _  ~-_.-"-." ._ /._ ." ./]],
				[[ >--.  ~-.   ._  ~>-"    "\\   7   7   ]],
				[[^.___~"--._    ~-{  .-~ .  `\ Y . /    |]],
				[[ <__ ~"-.  ~       /_/   \   \I  Y   : |]],
				[[   ^-.__           ~(_/   \   >._:   | l______]],
				[[       ^--.,___.-~"  /_/   !  `-.~"--l_ /     ~"-.]],
				[[              (_/ .  ~(   /'     "~"--,Y   -=b-. _)]],
				[[               (_/ .  \  :           / l      c"~o \]],
				[[                \ /    `.    .     .^   \_.-~"~--.  )]],
				[[                 (_/ .   `  /     /       !       )/]],
				[[                  / / _.   '.   .':      /        ']],
				[[                  ~(_/ .   /    _  `  .-<_]],
				[[                    /_/ . ' .-~" `.  / \  \          ,z=.]],
				[[                    ~( /   '  :   | K   "-.~-.______//]],
				[[                      "-,.    l   I/ \_    __{--->._(==.]],
				[[                       //(     \  <    ~"~"     //]],
				[[                      /' /\     \  \     ,v=.  ((]],
				[[                    .^. / /\     "  }__ //===-  `]],
				[[                   / / ' '  "-.,__ {---(==-       -Row]],
				[[                 .^ '       :  T  ~"   ll]],
				[[                / .  .  . : | :!        \\]],
				[[               (_/  /   | | j-"          ~^]],
				[[                 ~-<_(_.^-~"]],
			},
			{
				[[  ]],
				[[  ]],
				[[  ]],
				[[  ]],
				[[    >\_/<]],
				[[   _\*v*/_]],
				[[   \\   //]],
				[[  ===="====]],
				[[     /^\ as]],
			},
			{
				[[  ]],
				[[  ]],
				[[  ]],
				[[  ]],
				[[]],
				[[-------|-------------------------------------------------|---------]],
				[[    ___|___                                           ___|___]],
				[[   ////////\   _                                 _   /\\\\\\\\]],
				[[  ////////  \ ('<                               >') /  \\\\\\\\]],
				[[  | (_)  |  | (^)                               (^) |  | (_)  |]],
				[[  |______|.===="==                             =="====.|______|]],
				[[---------------------------------------------------------------ldb--]],
				[[]],
			},
			{
				[[  ]],
				[[]],
				[[                        .`.]],
				[[                      .`   `.]],
				[[                    .`       `.]],
				[[                  .`    __     `.]],
				[[                .`  __/.o-.`.    `.]],
				[[              .`   `-.>_   ) |     `.]],
				[[            .`        |_`\/ _\       `.]],
				[[          .`        .'   `./ `.        `.]],
				[[        .`         ;      /    \     ,   `.]],
				[[      .`           |.-'-.;      ;   / \    `.]],
				[[    .`             '     |      |  |   |    _`.]],
				[[  .`          /\    ;    ;      |  '   /_.-'.-'`.]],
				[[ '.          /  \    \    \     '___\.'.--'`    .`]],
				[[   `.      _.--. ;    \   _;._.-_.--._`L.__   .`]],
				[[     `.    \    `.  /7.-((.-'--'|mx   '---.'.`]],
				[[       `.   `-.__.\/.;'` `\ /`\ |         .`]],
				[[         `.      _/// `\  |`|  `'       .`]],
				[[           `.   /.-|    | | |  |      .`]],
				[[             `.//   \  /  | |  ;    .`]],
				[[               `.    `/   | |   \ .`]],
				[[                 `.       ._'---'`]],
				[[                   `.         .`]],
				[[                     `.     .`]],
				[[                       `. .`]],
				[[                         `]],
				[[]],
			},
			{

				[[  ]],
				[[]],
				[[                                 .....]],
				[[                            .e$$$$$$$$$$$$$$e.]],
				[[                          z$$ ^$$$$$$$$$$$$$$$$$.]],
				[[                        .$$$* J$$$$$$$$$$$$$$$$$$$e]],
				[[                       .$"  .$$$$$$$$$$$$$$$$$$$$$$*-]],
				[[                      .$  $$$$$$$$$$$$$$$$***$$  .ee"]],
				[[         z**$$        $$r ^**$$$$$$$$$*" .e$$$$$$*"]],
				[[        " -\e$$      4$$$$.         .ze$$$""""]],
				[[       4 z$$$$$      $$$$$$$$$$$$$$$$$$$$"]],
				[[       $$$$$$$$     .$$$$$$$$$$$**$$$$*"]],
				[[     z$$"    $$     $$$$P*""     J$*$$c]],
				[[    $$"      $$F   .$$$          $$ ^$$]],
				[[   $$        *$$c.z$$$          $$   $$]],
				[[  $P          $$$$$$$          4$F   4$]],
				[[ dP            *$$$"           $$    '$r]],
				[[.$                            J$"     $"]],
				[[$                             $P     4$]],
				[[F                            $$      4$]],
				[[                            4$%      4$]],
				[[                            $$       4$]],
				[[                           d$"       $$]],
				[[                           $P        $$]],
				[[                          $$         $$]],
				[[                         4$%         $$]],
				[[                         $$          $$]],
				[[                        d$           $$]],
				[[                        $F           "3]],
				[[                 r=4e="  ...  ..rf   .  ""% Gilo94']],
				[[                $**$*"^""=..^4*=4=^""  ^"""]],
				[[]],
			},
			{

				[[  ]],
				[[  ]],
				[[]],
				[[                              ....]],
				[[                      .: :..:::::']],
				[[                   ..:.::''''  '''     .. . .]],
				[[                 .':: ::''  .. ..   .::'' ''']],
				[[                  ':::' .::.'::  .'..::::::.]],
				[[               ..:.::::: '.. :.'.:''']],
				[[         ...:'''  '':'::':'   '']],
				[[        :^ ^  'o>   .:''']],
				[[        :..'        '.]],
				[[         '''''::    ':             .........]],
				[[              :     :.       ...::''' ' ' '''::.]],
				[[            .::     ':::.:':'''''            :::':.]],
				[[           .::'                             :::]],
				[[           ::'                              ::. ...::.]],
				[[          .::'                        .      '''.' . :.]],
				[[          '::.                       ::... .  .'.''':::.]],
				[[           ':.                   ....:::::':::::.    ':::..]],
				[[           .:'         .:'.:.'::::::' '        ':::..  ':::::.]],
				[[      ....:::::..     .:::::::'' '                 '':.    '':']],
				[[    .':.:.:::::::'. ...:: '']],
				[[  .'.''          .':'::'  LGB]],
				[[.::'          .''::]],
				[[              ' ':':'.. .]],
				[[                     '''.']],
				[[]],
			},
			{
				[[  ]],
				[[>> rabbit  << 10/96]],
				[[]],
				[[        .--,_]],
				[[       / ,/ /]],
				[[      / // /]],
				[[     / // /]],
				[[   .'  ' (]],
				[[  /       \.-"""-._]],
				[[ / a   ' .    '    `-.]],
				[[(       .  '      "   `.]],
				[[ `-.-'       "       '  ;]],
				[[     `.'  "  .  .-'    " ;]],
				[[      : .     .'          ;]],
				[[      `.   ' :     '   '  ;]],
				[[ jgs    )  _.". "     .  ";]],
				[[      .'_.'   .'   '  __.,`.]],
				[[     '"      ""''---'`    "']],
				[[]],
			},
			{
				[[  ]],
				[[  ]],
				[[  ]],
				[[  ]],
				[[]],
				[[   __     __]],
				[[  /_/|   |\_\  ]],
				[[   |U|___|U|]],
				[[   |       |]],
				[[   | ,   , |]],
				[[  (  = Y =  )]],
				[[   |   `   |]],
				[[  /|       |\]],
				[[  \| |   | |/]],
				[[ (_|_|___|_|_)]],
				[[   '"'   '"']],
				[[]],
			},
			{
				[[  ]],
				[[  ]],
				[[  ]],
				[[  ]],
				[[]],
				[[                     _.---._     .---.]],
				[[            __...---' .---. `---'-.   `.]],
				[[        .-''__.--' _.'( | )`.  `.  `._ :]],
				[[      .'__-'_ .--'' ._`---'_.-.  `.   `-`.]],
				[[             ~ -._ -._``---. -.    `-._   `.]],
				[[                  ~ -.._ _ _ _ ..-_ `.  `-._``--.._]],
				[[                               -~ -._  `-.  -. `-._``--.._.--''. ]],
				[[                                    ~ ~-.__     -._  `-.__   `. `. ]],
				[[                                      jgs ~~ ~---...__ _    ._ .` `. ]],
				[[                                                      ~  ~--.....--~ ]],
				[[]],
			},
			{
				[[  ]],
				[[@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'~~~     ~~~`@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@@@@@@@@@@'                     `@@@@@@@@@@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@@@@@@@'                           `@@@@@@@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@@@@@'                               `@@@@@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@@@'                                   `@@@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@@'                                     `@@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@'                                       `@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@                                         @@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@'                                         `@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@                                           @@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@                                           @@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@                       n,                  @@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@                     _/ | _                @@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@                    /'  `'/                @@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@a                 <~    .'                a@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@                 .'    |                 @@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@a              _/      |                a@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@@a           _/      `.`.              a@@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@@@a     ____/ '   \__ | |______       a@@@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@@@@@a__/___/      /__\ \ \     \___.a@@@@@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@@@@@/  (___.'\_______)\_|_|        \@@@@@@@@@@@@@@@@@@@@@@@@]],
				[[@@@@@@@@@@@@@@@@@@|\________                       ~~~~~\@@@@@@@@@@@@@@@@@@]],
				[[~~~\@@@@@@@@@@@@@@||       |\___________________________/|@/~~~~~~~~~~~\@@@]],
				[[    |~~~~\@@@@@@@/ |  |    | | by: S.C.E.S.W.          | ||\____________|@@]],
				[[]],
			},
			{
				[[  ]],
				[[  ]],
				[[  ]],
				[[  ]],
				[[                         ,ood8888booo,]],
				[[                      ,oda8a888a888888bo,]],
				[[                   ,od88888888aa888aa88a8bo,]],
				[[                 ,da8888aaaa88a888aaaa8a8a88b,]],
				[[                ,oa888aaaa8aa8888aaa8aa8a8a88o,]],
				[[               ,88888aaaaaa8aa8888a8aa8aa888a88,]],
				[[               8888a88aaaaaa8a88aa8888888a888888]],
				[[               888aaaa88aa8aaaa8888; ;8888a88888]],
				[[               Y888a888a888a8888;'   ;888888a88Y]],
				[[                Y8a8aa8a888a88'      ,8aaa8888Y]],
				[[                 Y8a8aa8aa8888;     ;8a8aaa88Y]],
				[[                  `Y88aa8888;'      ;8aaa88Y']],
				[[          ,,;;;;;;;;'''''''         ;8888Y']],
				[[       ,,;                         ,888P]],
				[[      ,;  ,;,                      ;""]],
				[[     ;       ;          ,    ,    ,;]],
				[[    ;  ;,    ;     ,;;;;;   ;,,,  ;]],
				[[   ;  ; ;  ,' ;  ,;      ;  ;   ;  ;]],
				[[   ; ;  ; ;  ;  '        ; ,'    ;  ;]],
				[[   `;'  ; ;  '; ;,       ; ;      ; ',]],
				[[        ;  ;,  ;,;       ;  ;,     ;;;]],
				[[         ;,,;             ;,,;]],
				[[    Brent Hughes <bhughes@sms.business.uwo.ca>]],
				[[]],
			},
			{
				[[  ]],
				[[]],
				[[                                       _____]],
				[[                            __aammm###########Wma__]],
				[[                         _wM#######################Mw_]],
				[[                       _###############################_]],
				[[                     _g########M##0###M#######M#P########m]],
				[[                   _g#########K_7#J#@#K0##E0##K##d########&_]],
				[[                  a#####F#######L"J#&#10##########W#########L]],
				[[                j##M#@""j#@######k ###########################g_]],
				[[               J###     J#&#######_0###########################&]],
				[[               ###KJ#  J##########&j############################L]],
				[[              g###_## ,#########################################L]],
				[[              ###W### ###########################################]],
				[[             ,#######a###########################################]],
				[[             7########################K]##M####F##"#####@########]],
				[[              #######################Z_0#L 0###F 4  ##W#L5#######]],
				[[              ##################~###E, #^^q##H#  `K '#-9r-9#M####]],
				[[              #################1j##P  J'  J#P #   '    `   ]F0###]],
				[[              '################ WP ___2   ^"         __p*&w _ ###]],
				[[               "###MP*#####KJ#K "a#M""@9#            0" _#@# J###]],
				[[                 #  eL_#### J# g@"  _## F            I_###1F I10L]],
				[[                 1 E^-J###   ^{"9mw&@M# J            *M#W0mF I1"]],
				[[                  X,wF9###     3_#M####_r            __ 0#Jw 0]],
				[[                   ^_ ^###      QdK..@@*L         _   "''    I]],
				[[                    "\_###K                       'p         f]],
				[[                      "0##1                    ___"         +]],
				[[       _a--s.__         9#&._              *'"""M#        _/]],
				[[     _-"          -- wm P7##~+,_           'Tw__/"       *"]],
				[[    w"                 J_ "#2v "<_            ~"      _ ']],
				[[  _+                    7_  " ',  +L_               _m']],
				[[  "                      ",    "*     mwa___    _*-]],
				[[                           ._    `m_        @Z94_]],
				[[     Andrew Crowe           ^       =L_    ,*", `-s.___]],
				[[                              q       "-w*    I         -]],
				[[                               " .__.,.m3=.,,/]],
				[[                                           "]],
			},
			{
				[[  ]],
				[[  ]],
				[[  ]],
				[[  ]],
				[[                      ==============================+]],
				[[                     ||        a'    `8888888####a:f|]],
				[[                     ||    .a:8'      `888888888####|]],
				[[                     || .a8:P'     /   `888888888###|]],
				[[                     ||a8P'       / __= `888888888##|]],
				[[                     ||'       _____     Y8888888###|]],
				[[                     ||   >--''  /        88888888##|]],
				[[                     ||_   \ aa /         `8888888##|]],
				[[                     || \   `88P /   _____ Y88888###|]],
				[[                     ||  \    =-'_.-'   , \ Y88#####|]],
				[[                     || a/            ,'/  |`888####|]],
				[[                     ||^           _-'|/     8888###|]],
				[[                     ||        _.-: | /     d8888###|       _]],
				[[                     ||  __,.-| | | ,'      d8888###|      ( `\]],
				[[                     ||"'| |  | | ,'       d8888####|     (  ? )]],
				[[                     ||  | |  L.-'       .d8888#####|     (`,-']],
				[[                     ||__|.J-'          ,888888#####|   _ o ]],
				[[               []    ||              _oo88888#######|  ( )_   ]],
				[[                     ||             d88888888#######|  (  `\  ]],
				[[      .--.            '-----------------------------'   \\//  ]],
				[[      )  (                                              )`")]],
				[[____  |==| ___________________________________________  |  ( ____]],
				[[     /__/|                                              |J |]],
				[[     | | '                                               `"']],
				[[     ` ']],
				[[]],
			},
			{
				[[  ]],
				[[  ]],
				[[  ]],
				[[  ]],
				[[     .    .     .            +         .         .                 .  .]],
				[[      .                 .                   .               .]],
				[[              .    ,,o         .                  __.o+.]],
				[[    .            od8^                  .      oo888888P^b           .]],
				[[       .       ,".o'      .     .             `b^'""`b -`b   .]],
				[[             ,'.'o'             .   .          t. = -`b -`t.    .]],
				[[            ; d o' .        ___          _.--.. 8  -  `b  =`b]],
				[[        .  dooo8<       .o:':__;o.     ,;;o88%%8bb - = `b  =`b.    .]],
				[[    .     |^88^88=. .,x88/::/ | \\`;;;;;;d%%%%%88%88888/%x88888]],
				[[          :-88=88%%L8`%`|::|_>-<_||%;;%;8%%=;:::=%8;;\%%%%\8888]],
				[[      .   |=88 88%%|HHHH|::| >-< |||;%;;8%%=;:::=%8;;;%%%%+|]88        .]],
				[[          | 88-88%%LL.%.%b::Y_|_Y/%|;;;;`%8%%oo88%:o%.;;;;+|]88  .]],
				[[          Yx88o88^^'"`^^%8boooood..-\H_Hd%P%%88%P^%%^'\;;;/%%88]],
				[[         . `"\^\          ~"""""'      d%P """^" ;   = `+' - P]],
				[[   .        `.`.b   .                :<%%>  .   :  -   d' - P      . .]],
				[[              .`.b     .        .    `788      ,'-  = d' =.']],
				[[       .       ``.b.                           :..-  :'  P]],
				[[            .   `q.>b         .               `^^^:::::,'       .]],
				[[    LS            ""^^               .                     .]],
				[[  .                                           .               .       .]],
				[[    .         .          .                 .        +         .]],
				[[                    Sienar Fleet Systems' TIE Bomber]],
				[[                           Light Space Bomber]],
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
				"  Config",
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
