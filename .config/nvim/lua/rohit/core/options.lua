vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.mouse = 'a'

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = false
vim.opt.breakindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250
vim.opt.cmdheight = 0

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.fillchars:append { diff = "╱" }

vim.opt.hidden = true
vim.opt.smoothscroll = true
vim.opt.termguicolors = true

vim.g.editorconfig = false

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.laststatus = 3
vim.opt.showtabline = 1

vim.opt.foldmethod = "marker"

vim.opt.splitbelow = true
vim.opt.splitright = true
