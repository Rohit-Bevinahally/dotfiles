return {
    {
        'williamboman/mason.nvim',
        cmd = "Mason",
        config = function()
            local mason = require("mason")
            -- enable mason and configure icons
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                    border = 'rounded',
                },
            })
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            'williamboman/mason.nvim',
        },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                -- list of servers for mason to install
                ensure_installed = {
                    "ts_ls",
                    "html",
                    "cssls",
                    "lua_ls",
                    "clangd",
                },
                -- auto-install configured servers (with lspconfig)
                automatic_installation = true, -- not the same as ensure_installed
            })
        end,
    },
}
