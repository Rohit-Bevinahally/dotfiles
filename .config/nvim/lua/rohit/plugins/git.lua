return {
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    {
        'FabijanZulj/blame.nvim',
        opts = {
            blame_options = { '-w' },
        },
        keys = {
            { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Toggle Blame" },
        },
    },
    {
        "sindrets/diffview.nvim",
        keys = {
            { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Open DiffView" },
            { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close DiffView" },
            { "<leader>dfh", "<cmd>DiffviewFileHistory %<cr>", desc = "DiffView File History" },
        },
        config = function()
            require("diffview").setup({
                enhanced_diff_hl = true,
            })
        end,
    },
    -- {
    --     "kdheepak/lazygit.nvim",
    --     cmd = {
    --         "LazyGit",
    --         "LazyGitConfig",
    --         "LazyGitCurrentFile",
    --         "LazyGitFilter",
    --         "LazyGitFilterCurrentFile",
    --     },
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    --     keys = {
    --         { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    --     },
    -- },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end

                -- Navigation
                map("n", "]h", gs.next_hunk, "Next Hunk")
                map("n", "[h", gs.prev_hunk, "Prev Hunk")

                -- Actions
                map("n", "<leader>gsh", gs.stage_hunk, "[S]tage [h]unk")
                map("n", "<leader>grh", gs.reset_hunk, "[R]eset [h]unk")
                map("v", "<leader>gsh", function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "[S]tage [h]unk")
                map("v", "<leader>grh", function()
                    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, "[R]eset [h]unk")

                map("n", "<leader>gsb", gs.stage_buffer, "[S]tage [b]uffer")
                map("n", "<leader>grb", gs.reset_buffer, "[R]eset [b]uffer")

                map("n", "<leader>guh", gs.undo_stage_hunk, "[U]ndo stage [h]unk")

                map("n", "<leader>gph", gs.preview_hunk, "[P]review [h]unk")

                -- map("n", "<leader>gb", function()
                --     gs.blame_line({ full = true })
                -- end, "[B]lame line")
                -- map("n", "<leader>gtb", gs.toggle_current_line_blame, "[T]oggle line [B]lame")

                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
            end,
        },
    }
}
