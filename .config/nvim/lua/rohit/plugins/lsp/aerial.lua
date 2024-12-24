return {
  'stevearc/aerial.nvim',
  opts = {},
  keys = {
      { "<leader>la", "<cmd>AerialToggle!<cr>", desc = "LSP file overview" },
  },
  config = function()
      require("aerial").setup({
          on_attach = function(bufnr)
              vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
              vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
          end,
          layout = {
              default_direction = "prefer_left",
          },
          filter_kind = false,
          icons = {
              Array         = "󱡠 ",
              Boolean       = "󰨙 ",
              Class         = "󰆧 ",
              Constant      = "󰏿 ",
              Constructor   = " ",
              Enum          = " ",
              EnumMember    = " ",
              Event         = " ",
              Field         = " ",
              File          = "󰈙 ",
              Function      = "󰊕 ",
              Interface     = " ",
              Key           = "󰌋 ",
              Method        = "󰊕 ",
              Module        = " ",
              Namespace     = "󰦮 ",
              Null          = "󰟢 ",
              Number        = "󰎠 ",
              Object        = " ",
              Operator      = "󰆕 ",
              Package       = " ",
              Property      = " ",
              String        = " ",
              Struct        = "󰆼 ",
              TypeParameter = "󰗴 ",
              Variable      = "󰀫 ",
              Collapsed     = " ",
          },
      })
  end,
}
