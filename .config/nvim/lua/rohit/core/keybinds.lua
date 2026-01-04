vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local bind = vim.keymap.set

bind("n", "J", "mzJ`z")

-- While pasting over a word retain the paste
bind("x", "<leader>pp", [["_dP]])

-- Yank to outside vim
bind({ "n", "v" }, "<leader>y", [["+y]])
bind("n", "<leader>Y", [["+Y]])

-- Delete to void register
bind({ "n", "v" }, "<leader>D", [["_d]])

-- Disable builtin maps
bind("n", "Q", "<nop>")
bind("n", "s", "<nop>")

-- Save
bind("n", "<leader><leader>", "<cmd>w<cr>")

-- Horizontal scrolling with mouse
bind("n", "<M-ScrollWheelUp>", "5zh")
bind("n", "<M-ScrollWheelDown>", "5zl")

-- Convert float to buffer
bind("n", "<C-w>B", "mZ<C-w>q'Z", { desc = "Break out into new buffer" })

-- Copy path of current file to clipboard
bind("n", "<leader>cfp", "<cmd>let @+ = expand('%:.')<cr>", { desc = "[C]opy current [F]ile [P]ath" })
bind("n", "<leader>cfP", "<cmd>let @+ = expand('%:p')<cr>", { desc = "[C]opy full current [F]ile [P]ath" })

-- Terminal to normal mode using esc
bind("t", "<esc>", "<C-\\><C-n>")

-- Easier block navigation
bind("n", "<CR>", "%")

-- Tab operations
bind("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "[T]ab [N]ew" })
bind("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "[T]ab [C]lose" })
bind("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "[T]ab [O]nly" })

-- Buffer/Tab Navigation
bind("n", "<C-p>", "<cmd>tabp<cr>", { desc = "Prev Tab" })
bind("n", "<C-n>", "<cmd>tabn<cr>", { desc = "Next Tab" })
bind("n", "<C-e>", "<C-6>", { desc = "Switch to last buffer" })

-- Source file
bind('n', '<leader>so', '<cmd>source %<CR>')

-- Split Controls
bind({'n', 'v'}, "<C-\\>", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
bind({'n', 'v'}, "<C-->", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Remap Increment number to avoid tmux conflict
bind({'n', 'v'}, '<leader>i', '<C-a>', { desc = "Increment Number" })
