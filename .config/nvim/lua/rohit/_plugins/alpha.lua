local store = require("rohit.store")
return {
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = store.get_dashboard_header()
            dashboard.section.buttons.val = {
                dashboard.button("s", " " .. " Load Session",    [[<cmd> lua require("persistence").load() <cr>]]),
                dashboard.button("n", "󰻭 " .. " New file",        [[<cmd> ene <BAR> startinsert <cr>]]),
                dashboard.button("f", "󰱽 " .. " Find files",      ":Telescope find_files <CR>"),
                dashboard.button("r", "󰕁 " .. " Recent files",    ":Telescope oldfiles <CR>"),
                dashboard.button("g", "󰺯 " .. " Find text",       ":Telescope live_grep <CR>"),
                dashboard.button("l", "󰒲 " .. " Lazy",            ":Lazy<CR>"),
                dashboard.button("q", " " .. " Quit",            ":qa<CR>"),
            }
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.opts.layout[1].val = 1
            return dashboard
        end,
        config = function(_, dashboard)
            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    once = true,
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            require("alpha").setup(dashboard.opts)

            vim.api.nvim_create_autocmd("User", {
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = math.floor(stats.startuptime * 100) / 100
                    dashboard.section.footer.val = "󱐌 Lazy-loaded "
                    .. stats.loaded
                    .. "/"
                    .. stats.count
                    .. " plugins  in "
                    .. ms
                    .. "ms"
                    dashboard.section.footer.opts.hl = "AlphaFooter"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaReady",
                desc = "Disable statusline for alpha",
                callback = function()
                    vim.o.laststatus = 0
                end,
            })
            vim.api.nvim_create_autocmd("BufUnload", {
                buffer = 0,
                desc = "Enable statusline after alpha",
                callback = function()
                    vim.o.laststatus = 3
                end,
            })
        end,
    },
}
