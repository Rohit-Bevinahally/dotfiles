return {
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        -- event = "VeryLazy",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                -- disable italic for functions
                transparent = true,
                styles = {
                    functions = {},
                    floats = "transparent",
                },
                dim_inactive = true,

                on_highlights = function(hl, c)
                    hl.TelescopeBorder = {
                        fg = "#29a4bd"
                    }
                    hl.TelescopePromptBorder = {
                        fg = "#ff9e64"
                    }
                    hl.TelescopePromptTitle = {
                        fg = "#ff9e64"
                    }
                    hl.LspInlayHint = {
                        fg = "#565f89",
                        italic = true
                    }
                    hl.WinSeparator = {
                        fg = "#7aa2f7",
                        bold = true
                    }
                end,
            })
            vim.cmd[[colorscheme tokyonight]]
        end,
    },
}
