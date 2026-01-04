local vscode = require('vscode')
local bind = vim.keymap.set
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- vscode bindings
bind('n', '<leader>gtb', function() vscode.action('gitlens.toggleLineBlame') end)

-- While pasting over a word retain the paste
bind("x", "<leader>pp", [["_dP]])

-- Yank to outside vim
bind({ "n", "v" }, "<leader>y", [["+y]])
bind("n", "<leader>Y", [["+Y]])

-- Delete to void register
bind({ "n", "v" }, "<leader>D", [["_d]])

-- Easier Text Navigation
vim.api.nvim_set_keymap("n", "E", "$", {noremap=false})
vim.api.nvim_set_keymap("n", "B", "^", {noremap=false})
bind("n", "<CR>", "%")

-- Source file
bind('n', '<leader>so', '<cmd>source %<CR>')
