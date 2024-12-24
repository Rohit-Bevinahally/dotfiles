return {
    {
        'mrjones2014/smart-splits.nvim',
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            { "<C-h>", function() require('smart-splits').move_cursor_left() end, desc = "Move cursor to the left split" },
            { "<C-j>", function() require('smart-splits').move_cursor_down() end, desc = "Move cursor to the bottom split" },
            { "<C-k>", function() require('smart-splits').move_cursor_up() end, desc = "Move cursor to the top split" },
            { "<C-l>", function() require('smart-splits').move_cursor_right() end, desc = "Move cursor to the right split" },
            { "<C-\\>", function() require('smart-splits').move_cursor_previous() end, desc = "Move cursor to the previous split" },
        },
        config = function()
            require('smart-splits').setup()
        end,
    },
    {
        "szw/vim-maximizer",
        keys = {
            { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
        },
    }
}
