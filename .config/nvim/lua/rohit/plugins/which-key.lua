return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts_extend = { "spec" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    spec = {
        {
            mode = {"n", "v"},
            { "<leader>k", group = "Picker" },
            { "<leader>t", group = "Toggle" },
            { "<leader>b", group = "Buffer" },
            { "<leader>o", group = "Overseer" },
            { "<leader>g", group = "Git" },
            { "<leader>q", group = "Persistence" },
        },
    },
  },
}
