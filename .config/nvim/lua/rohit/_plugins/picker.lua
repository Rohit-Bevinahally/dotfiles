return {
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        config = function()
            local fzf = require("fzf-lua")
            local actions = require("fzf-lua.actions")
            fzf.setup({
                defaults = {
                    no_header = true,
                },
                winopts = {
                    width = 0.9,
                    height = 0.9,
                    row = 0.5,
                    col = 0.5,
                },
                files = {
                    winopts = {
                        fullscreen = true,
                    },
                    cwd_prompt = false,
                    actions = {
                        ["alt-i"] = { actions.toggle_ignore },
                        ["alt-h"] = { actions.toggle_hidden },
                    },
                },
                grep = {
                    winopts = {
                        fullscreen = true,
                        preview = {
                            layout = "vertical",
                            vertical = "up:45%",
                        }
                    },
                    actions = {
                        ["alt-i"] = { actions.toggle_ignore },
                        ["alt-h"] = { actions.toggle_hidden },
                    },
                },
            })
        end,
        keys = {
            -- {
            --     "<leader>,",
            --     "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
            --     desc = "Switch Buffer",
            -- },
            -- { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
            { "<leader>pf", "<cmd>FzfLua files<cr>", desc = "Find files" },
            { "<leader>ps", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
            { "<leader>pw", "<cmd>FzfLua grep_cword<cr>", desc = "Word (Root Dir)" },
            { "<leader>pw", "<cmd>FzfLua grep_visual<cr>", mode = "v", desc = "Selection (Root Dir)" },
            { "<leader>pr", "<cmd>FzfLua resume<cr>", desc = "Resume" },
        },
    },
}
