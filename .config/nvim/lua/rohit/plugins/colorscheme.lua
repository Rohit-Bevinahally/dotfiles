function ApplyColorScheme(color)
    color = color or "gruvbox-material"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function ()
            -- ApplyColorScheme()
        end
    },
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
                    functions = {}
                },
            })
            vim.cmd.hi 'Comment gui=none'
            ApplyColorScheme("tokyonight")
        end
    },
}
