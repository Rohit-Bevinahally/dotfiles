return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        "hrsh7th/cmp-cmdline",
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim", -- vs-code like pictograms
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local lspkind = require('lspkind')

        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                {
                    name = "cmdline",
                    option = {
                        ignore_cmds = { "Man", "!" },
                    },
                    keyword_length = 3,
                },
            }),
        })

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
                ['<C-u>'] = cmp.mapping.select_prev_item({ count = 4 }),
                ['<C-d>'] = cmp.mapping.select_next_item({ count = 4 }),
                ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
                ["<C-y>"] = cmp.mapping.complete(), -- show completion suggestions
            }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip", keyword_length = 2 }, -- snippets
                { name = "buffer", keyword_length = 3 }, -- text within current buffer
                { name = "path" }, -- file system paths
            }),
            -- configure lspkind for vs-code like pictograms in completion menu
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    symbol_map = { Codeium = "󰁨 " },
                }),
            },
            -- Add borders around the popup menu
            window = {
                completion = {
                    border = "rounded",
                    winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
                },
                documentation = {
                    border = "rounded",
                    winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
                },
            },
            -- Virtual text
            -- experimental = {
            --     ghost_text = {hlgroup = "Comment"},
            -- },
        })
    end,
}
