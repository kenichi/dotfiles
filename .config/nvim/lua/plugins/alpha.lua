return {
  {
    "goolord/alpha-nvim",

    config = function()
      -- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-1937804
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      math.randomseed(os.time())

      local function pick_color()
        local colors = {"String", "Identifier", "Keyword", "Number"}
        return colors[math.random(#colors)]
      end

      local function footer()
        local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
        local version = vim.version()
        local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

        return datetime .. "   " .. nvim_version_info
      end

      -- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-2185455
      local logo = { 
        "                                                                                  ",
        "                                                                                  ",
        "                      *((##*                                                      ",
        "                  /###%%#%&&&%,                           .%((//(/.              ",
        "                  #%%&&&&@@@@@@@*                        #%#&%@&%%##%%            ",
        "                 &&&@@@@@@@@@@@@@   .**(/(,*,/,*,       &@@@@@@@@@&&%%%*          ",
        "                 @@@@@@@@@@&@*                         %@@@@@@@@@@@@&&&&          ",
        "                  @@@@%/,               ,                 /@&%@@@@@@@&&&*         ",
        "                   &@,                 .                      /%@@@@@@@&.         ",
        "                .(..                  ,                         *#@@@@@#          ",
        "              .(                                                 .@@@@*           ",
        "              #                                                    (              ",
        "             ,             *%@%             .@@@@&*                 ,             ",
        "          *            /@@@@@@&            @@@@@@@@&                .*           ",
        "          ,            @@@@@@@@,   ...  .   .@@@@@@@@@                 /          ",
        "          /           @@@@@@/                  *&@@@@@&                           ",
        "         /           ,@&@@@.    %@@@@@@@@@,     .#@@@&&                 ,         ",
        "         #            (%%%/    *@@@@@@@@@%*      *&%#(*                 /         ",
        "         *        .     .           /                   , .,.                     ",
        "          .                /                     *                      *         ",
        "          *                #.    ./%,%/.      ,%                       /..        ",
        "          .,                                                        ,,*  *        ",
        "            %*                                 (%%#%%(,          *&*..    ,       ",
        "           ,/**#@%,**         ........ ...    #&&&@&&&%%%&(,#@@@@@&##%(%%#,,.     ",
        "          .%@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@@@(@@@@@@&&@@%&%%&&&#@@@@@@@@&&&%(,    ",
        "          (%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@@&&%&@%&@@@@@@@@@%#,   ",
        "        *&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@&%&&*&@@@@@@&&#.  ",
        "        &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@@&@@@&&(@@@@@@&%* ",
        "      .#@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@%@@@(@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@##@@@@#.",
        "      /@@@@@@@@@@@%%&%@&##%&#%/(@(&#%%###%&%@/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&/",
        "     @@@@@@@@@@%((/((**,.,,,,*,,.,*.*.,*,,,,.. @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/",
        "    .@@@@@@@@@/.*   .                           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(",
      }

      dashboard.section.header.val = logo
      dashboard.section.header.opts.hl = pick_color()

      dashboard.section.buttons.val = {
        -- dashboard.button("<Leader>ff", "  File Explorer"),
        -- dashboard.button("<Leader>fo", "  Find File"),
        -- dashboard.button("<Leader>fw", "  Find Word"),
        -- dashboard.button("<Leader>ps", "  Update plugins"),
        -- dashboard.button("q", "  Quit", ":qa<cr>")
      }

      dashboard.section.footer.val = footer()
      dashboard.section.footer.opts.hl = "Constant"

      alpha.setup(dashboard.opts)

      vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
      ]])
    end,
  },
}
