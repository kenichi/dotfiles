local is_sunos = vim.loop.os_uname().sysname == "SunOS"

local unix_build = function()
  if is_sunos then
    -- on illumos, build oniguruma from source, install to /opt/oniguruma
    -- https://github.com/kkos/oniguruma (archived apr 2025)
    return function()
      vim.fn.system({
        "git",
        "-C",
        plugin.dir,
        "apply",
        vim.fn.stdpath("config") .. "/patch/avante.nvim-solaris.patch"
      })

      local result = vim.system(
        {"make", "BUILD_FROM_SOURCE=true"},
        {
          cwd = plugin.dir,
          env = {
            PKG_CONFIG_PATH = vim.env.PKG_CONFIG_PATH .. ":/opt/oniguruma/lib/pkgconfig",
            RUSTONIG_SYSTEM_LIBONIG = "1",
            RUSTFLAGS = "-C link-arg=-R/opt/oniguruma/lib",
          },
          timeout = 1800000, -- ms (30 minutes)
        }
      ):wait()

      if result.code ~= 0 then
        vim.notify("Build failed: " .. result.stderr, vim.log.levels.ERROR)
      end
    end
  else
    return "make"
  end
end

return {
  "yetone/avante.nvim",

  -- keep this version! (...on sunos)
  commit = "5e4bb50dd",
  pin = is_sunos,

  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or unix_build(),
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = "avante.md",
    -- for example
    provider = "claude",
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
      },
      -- moonshot = {
      --   endpoint = "https://api.moonshot.ai/v1",
      --   model = "kimi-k2-0711-preview",
      --   timeout = 30000, -- Timeout in milliseconds
      --   extra_request_body = {
      --     temperature = 0.75,
      --     max_tokens = 32768,
      --   },
      -- },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    -- "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
    -- "stevearc/dressing.nvim", -- for input provider dressing
    -- "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    -- "zbirenbaum/copilot.lua", -- for providers='copilot'
    -- {
    --   -- support for image pasting
    --   "HakonHarnes/img-clip.nvim",
    --   event = "VeryLazy",
    --   opts = {
    --     -- recommended settings
    --     default = {
    --       embed_image_as_base64 = false,
    --       prompt_for_file_name = false,
    --       drag_and_drop = {
    --         insert_mode = true,
    --       },
    --       -- required for Windows users
    --       use_absolute_path = true,
    --     },
    --   },
    -- },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        -- file_types = { "markdown", "Avante" },
        file_types = { "Avante" },
      },
      -- ft = { "markdown", "Avante" },
      ft = { "Avante" },
    },
  },
}
