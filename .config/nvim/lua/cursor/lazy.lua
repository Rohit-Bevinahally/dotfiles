local lazypath = vim.fn.stdpath("data") .. "/lazy_cursor/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    root = vim.fn.stdpath("data") .. "/lazy_cursor",
    spec = {
        { import = "cursor.plugins" },
    },
    lockfile = vim.fn.stdpath("config") .. "/lazy_cursor-lock.json",
    pkg = {
        enabled = true,
        cache = vim.fn.stdpath("state") .. "/lazy_cursor/pkg-cache.lua",
    },
    readme = {
        enabled = true,
        root = vim.fn.stdpath("state") .. "/lazy_cursor/readme",
    },
    rocks = {
        enabled = false,
        root = vim.fn.stdpath("data") .. "/lazy_cursor-rocks",
    },
    state = vim.fn.stdpath("state") .. "/lazy_cursor/state.json",
    change_detection = {
        enabled = false,
    }
})
