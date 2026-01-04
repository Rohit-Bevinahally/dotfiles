return {
    "nvim-lua/plenary.nvim", -- lua functions that many plugins use
    "p00f/clangd_extensions.nvim",
    {
        'mbbill/undotree',
        keys = {
            {"<leader>ut", "<cmd>UndotreeToggle<cr>", { desc = "Undo Tree" } },
        }
    },
    {
        "fei6409/log-highlight.nvim",
        config = function()
            require("log-highlight").setup({
                extension = { "log", "txt" }
            })
        end,
    },
    {
        "zk-org/zk-nvim",
        config = function()
            require("zk").setup({
                picker = "snacks_picker",
                lsp = {
                    config = {
                        name = "zk",
                        cmd = { "zk", "lsp" },
                        filetypes = { "markdown" },
                    },

                    auto_attach = {
                        enabled = true,
                    },
                },
            })
        end
    },
    {
        'mikesmithgh/kitty-scrollback.nvim',
        enabled = true,
        lazy = true,
        cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
        event = { 'User KittyScrollbackLaunch' },
        -- version = '*', -- latest stable version, may have breaking changes if major version changed
        -- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
        config = function()
            require('kitty-scrollback').setup()
        end,
    }
}
