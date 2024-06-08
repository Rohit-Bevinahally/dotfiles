vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Lex) -- Use netrw

-- Move a highlighted region between other lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- While pasting over a word retain the paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to outside vim
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix navigation
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>")
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>")

-- Splits control
vim.keymap.set("n", "fw", "<C-w>w")
vim.keymap.set("n", "fo", "<C-w>o")

-- Quickly replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Use gx plugin instead of netrw
vim.g.netrw_nogx = 1

-- Undo Tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Save
vim.keymap.set("n", "<leader><leader>", ":w<cr>")

-- Horizontal scrolling with mouse
vim.keymap.set("n", "<M-ScrollWheelUp>", "5zh")
vim.keymap.set("n", "<M-ScrollWheelDown>", "5zl")

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('custom-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
