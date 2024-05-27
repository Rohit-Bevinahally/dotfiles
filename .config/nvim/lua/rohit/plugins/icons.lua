return {
    'nvim-tree/nvim-web-devicons',
    config = function()
        require'nvim-web-devicons'.setup {
            -- your personnal icons can go here (to override)
            -- you can specify color or cterm_color instead of specifying both of them
            -- DevIcon will be appended to `name`
            -- Incrementally update this list using https://github.com/DaikyXendo/nvim-material-icon/blob/main/lua/nvim-material-icon.lua as referenece
            override = {
                zsh = {
                    icon = "",
                    color = "#89e051",
                    cterm_color = "113",
                    name = "Zsh",
                },
            };
            -- globally enable different highlight colors per icon (default to true)
            -- if set to false all icons will have the default icon's color
            color_icons = true;
            -- globally enable "strict" selection of icons - icon will be looked up in
            -- different tables, first by filename, and if not found by extension; this
            -- prevents cases when file doesn't have any extension but still gets some icon
            -- because its name happened to match some extension (default to false)
            strict = true;
            -- same as `override` but specifically for overrides by filename
            -- takes effect when `strict` is true
            override_by_filename = {
                -- [".gitignore"] = {
                --     icon = "",
                --     color = "#f1502f",
                --     name = "Gitignore"
                -- }
                ['package.json'] = {
                    icon = "󰎙",
                    color = "#8bc34a",
                    cterm_color = "113",
                    name = "PackageJson"
                },
            };
            -- same as `override` but specifically for overrides by extension
            -- takes effect when `strict` is true
            override_by_extension = {
                ["toml"] = {
                    icon = "",
                    color = "#42a5f4",
                    cterm_color = "66",
                    name = "Toml",
                },
                ["ts"] = {
                    icon = "󰛦",
                    color = "#0188d1",
                    cterm_color = "32",
                    name = "Ts",
                },
                ["cpp"] = {
                    icon = "",
                    color = "#519aba",
                    cterm_color = "67",
                    name = "Cpp",
                },
                ["sh"] = {
                    icon = "",
                    color = "#ff7043",
                    cterm_color = "203",
                    name = "Sh",
                },
            };
        }
    end,
}
