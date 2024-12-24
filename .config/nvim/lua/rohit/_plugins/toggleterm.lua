return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    keys = {
        {'<C-t>', ':ToggleTerm<CR>', mode = 'n', desc = 'Toggle terminal'},
        {'<C-t>', '<C-\\><C-n><cmd>ToggleTerm<CR>', mode = 't', desc = 'Toggle terminal'},
        {"<leader>tat", "<cmd>ToggleTermToggleAll<CR>", desc = '[T]oggle [A]ll [T]erminals'},
    },
}
