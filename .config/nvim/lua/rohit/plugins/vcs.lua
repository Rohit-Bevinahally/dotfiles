return {
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
        keys = {
            { "<leader>gvo", "<cmd>DiffviewOpen<cr>", desc = "Open DiffView" },
            { "<leader>gvc", "<cmd>DiffviewClose<cr>", desc = "Close DiffView" },
            { "<leader>gfH", "<cmd>DiffviewFileHistory %<cr>", desc = "DiffView File History" },
        },
        config = function()
            require("diffview").setup({
                enhanced_diff_hl = true,
            })
        end,
    },
    {
      'axkirillov/unified.nvim',
      cmd = { "Unified" },
      opts = {
      }
    },
    {
        "julienvincent/hunk.nvim",
        cmd = { "DiffEditor" },
        config = function()
            require("hunk").setup({
                ui = {
                    layout = "horizontal",
                }
            })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            signs_staged = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end

                -- Navigation
                map("n", "]h", gs.next_hunk, "Next Hunk")
                map("n", "[h", gs.prev_hunk, "Prev Hunk")
                map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
                map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")

                -- Actions
                -- Hunk
                map("n", "<leader>gph", gs.preview_hunk_inline, "[P]review [h]unk")
                map("n", "<leader>gsh", gs.stage_hunk, "[S]tage [h]unk")
                map("n", "<leader>grh", gs.reset_hunk, "[R]eset [h]unk")
                map("v", "<leader>gsh", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "[S]tage [h]unk")
                map("v", "<leader>grh", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "[R]eset [h]unk")
                map("n", "<leader>guh", gs.undo_stage_hunk, "[U]ndo stage [h]unk")

                -- Buffer
                map("n", "<leader>gsb", gs.stage_buffer, "[S]tage [b]uffer")
                map("n", "<leader>grb", gs.reset_buffer, "[R]eset [b]uffer")

                -- Blame
                map("n", "<leader>gbb", function() gs.blame() end, "[B]lame [b]uffer")
                map("n", "<leader>gbl", function() gs.blame_line({ full = true }) end, "[B]lame [l]ine")

                -- Diff
                map("n", "<leader>gd", gs.diffthis, "[D]iff This")
                map("n", "<leader>gD", function() gs.diffthis("~") end, "[D]iff This ~")

                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
            end,
        },
    }
}
