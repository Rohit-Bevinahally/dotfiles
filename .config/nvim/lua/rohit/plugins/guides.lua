return {
    -- Indentation Guide
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        main = "ibl",
        opts = {
            indent = { char = "┊" },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "neo-tree",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                },
            },
        },
    },
}
