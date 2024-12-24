return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "Illustrator",
                    path = "~/notes/Illustrator",
                },
            },
            ui = {
                enable = false,
            },
        },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        keys = {
            { '<leader>tm', '<cmd>RenderMarkdown toggle<cr>', desc = "[T]oggle [M]arkdown Render" },
        },
        ft = { 'markdown' },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
}
