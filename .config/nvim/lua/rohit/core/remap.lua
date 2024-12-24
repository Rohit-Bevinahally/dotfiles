vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Move a highlighted region between other lines
vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- While pasting over a word retain the paste
vim.keymap.set("x", "<leader>pp", [["_dP]])

-- Yank to outside vim
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>D", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "s", "<nop>")

-- Use gx plugin instead of netrw
-- vim.g.netrw_nogx = 1

-- Undo Tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Save
vim.keymap.set("n", "<leader><leader>", "<cmd>w<cr>")

-- Horizontal scrolling with mouse
vim.keymap.set("n", "<M-ScrollWheelUp>", "5zh")
vim.keymap.set("n", "<M-ScrollWheelDown>", "5zl")

-- Convert float to buffer
vim.keymap.set("n", "<C-w>B", "mZ<C-w>q'Z", { desc = "Break out into new buffer" })

-- Copy path of current file to clipboard
vim.keymap.set("n", "<leader>cfp", "<cmd>let @+ = expand('%')<cr>", { desc = "[C]opy current [F]ile [P]ath" })
vim.keymap.set("n", "<leader>cfP", "<cmd>let @+ = expand('%:p')<cr>", { desc = "[C]opy full current [F]ile [P]ath" })

-- Toggle text wrap
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<cr>", { desc = "[T]oggle [W]rap" })

-- Terminal to normal mode using esc
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- Easier Text Navigation
vim.api.nvim_set_keymap("n", "E", "$", {noremap=false})
vim.api.nvim_set_keymap("n", "B", "^", {noremap=false})

-- Buffer Navigation
vim.keymap.set("n", "<C-p>", "<cmd>bp<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<C-n>", "<cmd>bn<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<C-e>", "<C-6>", { desc = "Switch to last buffer" })

-- Source file
vim.keymap.set('n', '<leader>so', '<cmd>source %<CR>')
