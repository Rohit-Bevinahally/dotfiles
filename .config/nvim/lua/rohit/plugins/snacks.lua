local store = require("rohit.store")

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        -- scroll = { enabled = true },
        input = { enabled = true },
        image = { enabled = true },
        explorer = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        styles = {
            notification = {
                wo = { wrap = true }
            }
        },
        dashboard = {
            enabled = true,
            preset = {
                header = store.get_dashboard_header(),
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 7, padding = 1 },
                {
                    pane = 2,
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = function()
                        return Snacks.git.get_root() ~= nil
                    end,
                    cmd = "hub status --short --branch --renames",
                    height = 5,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                },
                { section = "startup" },
            },
        },
        picker = {
            enabled = true,
            sources = {
                buffers = { layout = { preset = "ivy", }, },
                files = { layout = { fullscreen = true, },  },
                smart = { layout = { fullscreen = true, },  },
                grep = { layout = { fullscreen = true, preset = "dropdown" },  },
                grep_word = { layout = { fullscreen = true, preset = "dropdown" },  },
                grep_buffers = { layout = { fullscreen = true, preset = "dropdown" },  },
            },
        },
        styles = {
            notification_history = {
                width = 0.95,
                height = 0.95,
            },
        },
    },
    keys = {
        { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
        { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browser" },
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete current buffer" },
        { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
        { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        { "<C-t>",      function() Snacks.terminal() end, mode = 'n', desc = 'Toggle terminal'},
        { "<C-t>",      function() Snacks.terminal() end, mode = 't', desc = 'Toggle terminal'},
        { "<leader>ns", function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss notifications" },

        --Picker
        { "<leader>e",   function() Snacks.explorer() end, desc = "File Explorer" },
        { "<leader>kp",  function() Snacks.picker.pickers() end, desc = "Search for available pickers" },
        { "<leader>kk",  function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>kf",  function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>,",   function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>ks",  function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>kw",  function() Snacks.picker.grep_word() end, desc = "Grep Word", mode = {'n', 'x'} },
        { "<leader>/",   function() Snacks.picker.lines() end, desc = "Grep in Buffer" },
        { "<leader>kb",  function() Snacks.picker.grep_buffers() end, desc = "Grep across open buffers" },
        { "<leader>:",   function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>kr",  function() Snacks.picker.resume() end, desc = "Resume" },
        { "<leader>gfh", function() Snacks.picker.git_log_file() end, desc = "Git Current File History"},
        { "<leader>glb", function() Snacks.picker.git_log_line() end, desc = "Git Line Blame" },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.treesitter():map("<leader>uT")
                Snacks.toggle.inlay_hints():map("<leader>uh")
                Snacks.toggle.indent():map("<leader>ug")
                Snacks.toggle.dim():map("<leader>uD")
                Snacks.toggle.option("expandtab", { name = "Expand Tab" }):map("<leader>ui")
            end,
        })
    end,
}
