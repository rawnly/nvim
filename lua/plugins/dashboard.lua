local alien = {
  "     _                       _______                       _",
  "  _dMMMb._               .adOOOOOOOOOba.               _,dMMMb_",
  " dP'  ~YMMb             dOOOOOOOOOOOOOOOb             aMMP~  `Yb",
  ' V      ~"Mb           dOOOOOOOOOOOOOOOOOb           dM"~      V',
  "          `Mb.        dOOOOOOOOOOOOOOOOOOOb        ,dM',",
  "           `YMb._    |OOOOOOOOOOOOOOOOOOOOO|    _,dMP',",
  "      __      `YMMM| OP'~\"YOOOOOOOOOOOP\"~`YO |MMMP'      __",
  "    ,dMMMb.      ~~' OO     `YOOOOOP'     OO `~~      ,dMMMb.",
  " _,dP~  `YMba_      OOb      `OOO'      dOO      _aMMP'  ~Yb._",
}

local hydra = {
  "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
  "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
  "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
  "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
  "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
  "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
  "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
  " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
  " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
  "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
  "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
}

local logo = [[
                                                    
             ████ ██████           █████      ██
            ███████████             █████ 
            █████████ ███████████████████ ███   ███████████
           █████████  ███    █████████████ █████ ██████████████
          █████████ ██████████ █████████ █████ █████ ████ █████
        ███████████ ███    ███ █████████ █████ █████ ████ █████
       ██████  █████████████████████ ████ █████ █████ ████ ██████
    ]]

local astronaut = [[
        _..._
      .'     '.      _
     /    .-""-\   _/ \
   .-|   /:.   |  |   |
   |  \  |:.   /.-'-./
   | .-'-;:__.'    =/
   .'=  *=|NVIM _.='
  /   _.  |    ;
 ;-.-'|    \   |
/   | \    _\  _\
\__/'._;.  ==' ==\
         \    \   |
         /    /   /
         /-._/-._/
         \   `\  \
          `-._/._/
]]

local moon = [[
       _=|_
     _[_## ]_
_  +[_[_+_]P/    _    |_       ____      _=--|-~
 ~---\_I_I_[=\--~ ~~--[o]--==-|##==]-=-~~  o]H
-~ /[_[_|_]_]\\  -_  [[=]\]    |====]  __  !j]H
  /    "|"    \      ^U-U^  - |    - ~ .~  U/~
 ~~--__~~~--__~~-__   H_H_    |_     --   _H_
-. _  ~~~#######~~~     ~~~-    ~~--  ._ - ~~-=
           ~~~=~~  -~~--  _     . -      _ _ -
]]

return {
  {
    "echasnovski/mini.starter",
    enabled = true,
    opts = function(_, opts)
      return require("astrocore").extend_tbl(opts, {
        silent = true,
        items = {
          require("mini.starter").sections.builtin_actions(),
          require("mini.starter").sections.recent_files(5, true),
          require("mini.starter").sections.recent_files(5, false),
          require("mini.starter").sections.sessions(3, true),
        },
      })
    end,
  },
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>c"] = {
            function()
              local bufs = vim.fn.getbufinfo { buflisted = true }
              require("astrocore.buffer").close(0)
              if require("astrocore").is_available "mini.starter" and not bufs[2] then
                require("mini.starter").open()
                require("astrocore.buffer").close_all(true) -- remove empty buffer
              end
            end,
            desc = "Close buffer",
          },
        },
      },
    },
  },
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    enabled = false,
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = vim.split(moon, "\n")

      return opts
    end,
  },
}
