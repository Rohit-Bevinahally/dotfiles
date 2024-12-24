local cmdList = {
    openDiffView = function(value)
        return ("DiffviewOpen %s^!"):format(value)
    end,
    openPreviousFileVersion = function(value)
        return "Gsplit " .. value .. ":%"
    end,
    openCommitPatch = function(value)
        return "Gsplit " .. value
    end,
}

local function runCmd(_prompt_bufnr, cmd)
    local selection = require('telescope.actions.state').get_selected_entry()
    local value = selection.value
    require('telescope.actions').close(_prompt_bufnr)
    vim.cmd("stopinsert")
    vim.schedule(function()
        vim.cmd(cmd(value))
    end)
end

return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim',
        "debugloop/telescope-undo.nvim",
        "folke/todo-comments.nvim",
        {
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
    },
    keys = {
        { "<C-f>", "<cmd>Telescope buffers<cr>", desc = "Fuzzy find currently open buffers" },
        { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
        { "<leader>ph", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
        { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
        { "<leader>pw", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
        { "<leader>pr", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
        { "<leader>pt", "<cmd>TodoTelescope<cr>", desc = "Search for todos" },
        { "<leader>pu", "<cmd>Telescope undo<cr>", desc = "Go through undo states" },
        { "<leader>pl", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Live grep with args" },
        { "<leader>pk", "<cmd>Telescope keymaps<cr>", desc = "Show keymaps" },
        { "<leader>pn", "<cmd>Telescope notify<cr>", desc = "Show notification history" },
        { "<leader>pgg", "<cmd>Telescope git_files<cr>", desc = "Fuzzy find git files" },
        { "<leader>pgc", function()
                require('telescope.builtin').git_commits({
                    attach_mappings = function(_, map)
                        map({'i','n'}, '<C-Space>', function(_prompt_bufnr)
                            runCmd(_prompt_bufnr, cmdList.openDiffView)
                        end)
                        map({'i','n'}, '<C-p>', function(_prompt_bufnr)
                            runCmd(_prompt_bufnr, cmdList.openCommitPatch)
                        end)
                        return true
                    end
                })
            end,
            desc = "Show git commits"
        },

        { "<leader>pgf", function()
                require('telescope.builtin').git_bcommits({
                    attach_mappings = function(_, map)
                        map({'i','n'}, '<C-Space>', function(_prompt_bufnr)
                            runCmd(_prompt_bufnr, cmdList.openDiffView)
                        end)
                        map({'i','n'}, '<CR>', function(_prompt_bufnr)
                            runCmd(_prompt_bufnr, cmdList.openPreviousFileVersion)
                        end)
                        map({'i','n'}, '<C-p>', function(_prompt_bufnr)
                            runCmd(_prompt_bufnr, cmdList.openCommitPatch)
                        end)
                        return true
                    end
                })
            end,
            desc = "Show git commits for current file"
        },

        { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = 'Fuzzy find in current buffer' },
        { "<leader>/", function()
                local text = vim.getVisualSelection()
                require('telescope.builtin').current_buffer_fuzzy_find({ default_text = text })
            end,
            mode = 'v',
        },
        { "<leader>ps", function()
                local text = vim.getVisualSelection()
                require('telescope.builtin').grep_string({ search = text })
            end,
            mode = 'v',
        },
    },
    config = function()
        require('telescope').setup({
            defaults = {
                -- Display
                sorting_strategy = 'ascending',
                layout_strategy = 'vertical',
                layout_config = {
                    height = 0.9,
                    width = 0.9,
                    prompt_position = 'top',
                },
                -- Icons
                prompt_prefix = " 󰭎 ",
                selection_caret = " 󰓾 ",
                entry_prefix = "   ",
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--color", "never", "-g", "!.git" },
                    layout_config = {
                        preview_width = 0.3,
                    },
                    theme = "ivy",
                },
                oldfiles = {
                    layout_config = {
                        preview_width = 0.3,
                    },
                    theme = "ivy",
                },
                git_commits = {
                    results_title = false,
                },
                git_bcommits = {
                    results_title = false,
                    prompt_title = "File Commits",
                },
                current_buffer_fuzzy_find = {
                    tiebreak = function(a, b)
                        -- Sort tiebreaks by line number
                        return a.lnum < b.lnum
                    end,
                },
                buffers = {
                    show_all_buffers = true,
                    sort_lastused = true,
                    mappings = {
                        i = {
                            ["<c-d>"] = "delete_buffer",
                        },
                        n = {
                            ["d"] = "delete_buffer",
                        }
                    },
                    layout_config = {
                        preview_width = 0.3,
                    },
                    theme = "ivy",
                }
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
                ['undo'] = {
                    side_by_side = true,
                    layout_config = {
                        preview_height = 0.8,
                    },
                },
            },
        })

        vim.g.zoxide_use_select = true

        -- Keep transparent background
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    end,
}
