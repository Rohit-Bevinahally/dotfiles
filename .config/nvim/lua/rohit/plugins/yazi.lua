return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>fa",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      "<leader>fs",
      "<cmd>Yazi cwd<cr>",
      desc = "Open yazi in nvim cwd" ,
    },
    {
      '<leader>ff',
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = '<f1>',
    },
  },
}
