return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    event = "VeryLazy",
    keys = {
        { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
        { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
        { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
        { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
        { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
        { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
    config = function()
        local bufferline = require("bufferline");
        bufferline.setup {
            options = {
                always_show_bufferline = false,
                style_preset = {
                    bufferline.style_preset.no_italic,
                },
                close_command = false,
                buffer_close_icon = '',
                indicator = {
                    style = 'underline',
                },
                separator_style = 'slant',
            },
            highlights = {
                fill = {
                    bg = '#1d202f',
                },
                buffer_selected = {
                    fg = '#58b99d',
                },
                buffer_visible = {
                    fg = '#565f89',
                },
                separator = {
                    fg = '#1d202f',
                },
                separator_selected = {
                    fg = '#1d202f',
                },
                separator_visible = {
                    fg = '#1d202f',
                },
                tab_separator = {
                    fg = '#1d202f',
                },
                tab_separator_selected = {
                    fg = '#1d202f',
                },
            }
        }
    end,
}
