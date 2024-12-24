return {
    "nvim-lua/plenary.nvim", -- lua functions that many plugins use
    { "folke/twilight.nvim", event = "VeryLazy" },
    { "stevearc/dressing.nvim", event = "VeryLazy" },
    { "fei6409/log-highlight.nvim", event = "BufRead *.log", opts = {} },
    { 'windwp/nvim-ts-autotag', lazy = true },
    { 'mbbill/undotree', keys = { {"<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Undo Tree" } } } },
}
