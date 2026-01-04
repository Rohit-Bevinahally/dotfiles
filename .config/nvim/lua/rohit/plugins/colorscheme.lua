return {
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                -- disable italic for functions
                -- transparent = true,
                styles = {
                    -- functions = {},
                    -- floats = "transparent",
                },
                dim_inactive = false,

                on_colors = function(colors)
                    colors.fg = "#95b1ac"
                    -- Slightly deviate from original so that some terminals like kitty
                    -- dont apply transparency inside neovim, but keep it outside
                    colors.bg = "#24283c"
                end,

                on_highlights = function(hl, c)
                    hl.LspInlayHint = {
                        fg = "#565f89",
                        italic = true
                    }
                    hl.WinSeparator = {
                        fg = "#7aa2f7",
                        bold = true
                    }
                    hl.Bold = {
                        fg = "#58b99d",
                        bold = true
                    }
                    hl.SnacksPickerFile = {
                        fg = c.fg
                    }
                    hl.NormalFloat = {
                        fg = c.fg,
                    }
                    hl.LineNr = {
                        fg = hl.Comment.fg
                    }
                end,
            })
            vim.cmd[[colorscheme tokyonight]]
        end,
    },
}
