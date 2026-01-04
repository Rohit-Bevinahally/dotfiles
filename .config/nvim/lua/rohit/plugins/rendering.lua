return {
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local todo_comments = require("todo-comments")

            -- set keymaps
            local keymap = vim.keymap -- for conciseness

            keymap.set("n", "]t", function()
                todo_comments.jump_next()
            end, { desc = "Next todo comment" })

            keymap.set("n", "[t", function()
                todo_comments.jump_prev()
            end, { desc = "Previous todo comment" })

            todo_comments.setup()
        end,
    },
    {
        "OXY2DEV/markview.nvim", -- Markdown rendering
        lazy = false,
        branch = "main",
        opts = {
            preview = {
                filetypes = { "markdown" },
                ignore_buftypes = {},
                preview = {
                    icon_provider = "mini",
                }
            },
            max_length = 99999,
        },
        config = function()
            local presets = require("markview.presets")
            require("markview").setup({
                markdown = {
                    headings = presets.headings.glow,
                    horizontal_rules = presets.horizontal_rules.thick,
                }
            })
            vim.keymap.set("n", "<leader>mv", "<cmd>Markview Toggle<cr>", { desc = "Toggle MarkView" })
        end,
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
