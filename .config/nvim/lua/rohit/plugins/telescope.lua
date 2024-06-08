return {
    "nvim-telescope/telescope.nvim",
    event = 'VimEnter',
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        'nvim-telescope/telescope-ui-select.nvim',
        "debugloop/telescope-undo.nvim",
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        require('telescope').setup({
            defaults = {
                -- Display
                sorting_strategy = 'ascending',
                layout_strategy = 'vertical',
                layout_config = {
                    height = 0.95,
                    width = 0.95,
                    prompt_position = 'top',
                    mirror = true,
                    vertical = {
                        preview_cutoff = 0,
                    },
                },
                -- Icons
                prompt_prefix = " 󰭎 ",
                selection_caret = " ❯ ",
                entry_prefix = "   ",
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
                ['undo'] = {
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.8,
                    },
                },
            },
        })

        -- Enable installed extensions
        pcall(require('telescope').load_extension, 'undo')
        pcall(require('telescope').load_extension, 'ui-select')
        vim.g.zoxide_use_select = true

        -- Keep transparent background
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })

        -- set keymaps
        local builtin = require 'telescope.builtin'

        vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        vim.keymap.set("n", "<leader>ph", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        vim.keymap.set("n", "<leader>pb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find currently open buffers" })
        vim.keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        vim.keymap.set("n", "<leader>pw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        vim.keymap.set("n", "<leader>pr", "<cmd>Telescope resume<cr>", { desc = "Resume last search" })
        vim.keymap.set("n", "<leader>pt", "<cmd>TodoTelescope<cr>", { desc = "Search for todos" })
        vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<cr>", { desc = "Fuzzy find git files" })
        vim.keymap.set("n", "<leader>pu", "<cmd>Telescope undo<cr>", {desc = "Go through undo states" })
        vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                previewer = false,
            })
        end, { desc = 'Fuzzily search in current buffer' })

    end,
}
