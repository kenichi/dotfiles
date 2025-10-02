local blink_opts = {
  keymap = { preset = "default" },
  completion = {
    -- turn docs on during complete
    documentation = { auto_show = true },

    -- paste from https://cmp.saghen.dev/recipes.html#nvim-web-devicons-lspkind
    menu = {
      draw = {
        components = {
          kind_icon = {
            text = function(ctx)
              local icon = ctx.kind_icon
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                if dev_icon then
                  icon = dev_icon
                end
              else
                icon = require("lspkind").symbolic(ctx.kind, {
                  mode = "symbol",
                })
              end

              return icon .. ctx.icon_gap
            end,

            -- Optionally, use the highlight groups from nvim-web-devicons
            -- You can also add the same function for `kind.highlight` if you want to
            -- keep the highlight groups in sync with the icons.
            highlight = function(ctx)
              local hl = ctx.kind_hl
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                if dev_icon then
                  hl = dev_hl
                end
              end
              return hl
            end,
          }
        }
      }
    }
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    providers = {
      snippets = {
        opts = {
          friendly_snippets = true,
        },
      },
    },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
}


local blink_spec = {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },
  opts = blink_opts,
  opts_extend = { "sources.default" },
}

local is_sunos = vim.loop.os_uname().sysname == "SunOS"
return vim.tbl_extend("force",
  blink_spec,
  is_sunos
  and { build = "cargo build --release" }
  or { version = "1.*" }
)
