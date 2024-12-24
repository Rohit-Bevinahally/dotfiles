local store = require("rohit.store")

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
        { "<leader>glb", function() Snacks.git.blame_line() end, desc = "Git Line Blame" },
        { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browser" },
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete current buffer" },
        { "<leader>dn", function() Snacks.notifier.hide() end, desc = "Dismiss notifications" },
        { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
        { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        { "<C-t>", function() Snacks.terminal() end, mode = 'n', desc = 'Toggle terminal'},
        { "<C-t>", function() Snacks.terminal() end, mode = 't', desc = 'Toggle terminal'},
    },
    opts = {
        bigfile = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        bufdelete = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        styles = {
            notification = {
                wo = { wrap = true }
            }
        },
        lazygit = {
            enabled = true,
        },
        git = {
            enabled = true,
        },
        gitbrowser = {
            enabled = true,
        },
        scratch = {
            enabled = true,
        },
        terminal = {
            enabled = true,
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
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
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
    },
}
