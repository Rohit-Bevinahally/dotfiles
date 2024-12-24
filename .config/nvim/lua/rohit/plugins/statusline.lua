local overseer = require("overseer")

return {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = { "dashboard" },
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = vim.o.laststatus == 3,
                refresh = {
                    statusline = 100,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    {
                        'filename',
                        file_status = true,      -- Displays file status (readonly status, modified status)
                        newfile_status = false,  -- Display new file status (new file means no write after created)
                        path = 4,                -- 0: Just the filename
                        -- 1: Relative path
                        -- 2: Absolute path
                        -- 3: Absolute path, with tilde as the home directory
                        -- 4: Filename and parent dir, with tilde as the home directory

                        shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                        -- for other components. (terrible name, any suggestions?)
                        symbols = {
                            modified = '󱇧',      -- Text to show when the file is modified.
                            readonly = '󰈡',      -- Text to show when the file is non-modifiable or readonly.
                            unnamed = '', -- Text to show for unnamed buffers.
                            newfile = '󰎔',     -- Text to show for newly created file before first write
                        }
                    },
                },
                lualine_x = {
                    {
                        "overseer",
                        symbols = {
                            [overseer.STATUS.RUNNING] = "󰄉 ",
                        },
                        unique = true,
                    },
                    -- stylua: ignore
                    {
                        function() return require("noice").api.status.command.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                        color = { fg = "Statement" },
                    },
                },
                lualine_y = {
                    { "progress", separator = " ", padding = { left = 1, right = 0 } },
                    { "location", icons_enabled = true, icon = "", },
                },
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end,
}
