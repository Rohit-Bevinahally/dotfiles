return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local keymap = vim.keymap -- for conciseness

        local on_attach = function(client, bufnr)
            local opts = { noremap = true, buffer = bufnr }
            local telescope_builtin = require('telescope.builtin')

            -- set keybinds
            opts.desc = "[G]oto [D]eclaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "[G]oto [R]eferences"
            keymap.set("n", "gr", telescope_builtin.lsp_references, opts) -- show definition, references

            opts.desc = "[G]oto [D]efinition"
            keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts) -- show lsp definitions

            opts.desc = "[G]oto [I]mplementations"
            keymap.set("n", "gi", telescope_builtin.lsp_implementations, opts) -- show lsp implementations

            opts.desc = "[G]oto [T]ype Definitions"
            keymap.set("n", "gt", telescope_builtin.lsp_type_definitions, opts) -- show lsp type definitions

            opts.desc = "Show document symbols"
            keymap.set("n", "<leader>ls", telescope_builtin.lsp_document_symbols, opts)

            opts.desc = "[C]ode [A]ctions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "[R]e[n]ame"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "[L]ine [D]iagnostics"
            keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Show signature help"
            keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

            opts.desc = "[L]SP [R]e[s]tart"
            keymap.set("n", "<leader>lrs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

            -- clangd only
            opts.desc = "Switch between source and header"
            keymap.set({ "n", "v"}, "<leader>cs", "<cmd>ClangdSwitchSourceHeader<CR>", opts)

            opts.desc = "Symbol Info"
            keymap.set("n", "<leader>ci", "<cmd>ClangdSymbolInfo<CR>", opts)

            -- Enable inlay hints
            require("clangd_extensions.inlay_hints").setup_autocmd()
            require("clangd_extensions.inlay_hints").set_inlay_hints()

            if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                opts.desc = "[T]oggle Inlay [H]ints"
                keymap.set("n", "<leader>th", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end, opts)
            end
        end

        -- Use this for the capabilities field for each server
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, cmp_nvim_lsp.default_capabilities())

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = "󱈸 ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Do not show virtual text for diagnostics
        vim.diagnostic.config({
            virtual_text = false
        })

        -- UI changes
        require('lspconfig.ui.windows').default_options.border = 'rounded'

        -- Hide all semantic highlights
        -- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        --   vim.api.nvim_set_hl(0, group, {})
        -- end

        -- Setup lsp servers
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                        disable = { 'different-requires'},
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure typescript server with plugin
        lspconfig["tsserver"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            server = {
                init_options = {
                    plugins = {
                        {
                            name = 'ts-lit-plugin',
                            location = '/Users/rohitb/.nvm/versions/node/v16.20.2/lib/node_modules/ts-lit-plugin/'

                        },
                        {
                            name = 'typescript-lit-html-plugin',
                            location = '/Users/rohitb/.nvm/versions/node/v16.20.2/lib/node_modules/typescript-lit-html-plugin/'
                        },
                    },
                }
            },
            handlers = {
                ["textDocument/publishDiagnostics"] = function() end,
            },
        })

        -- configure css server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure cpp server
        lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            handlers = {
                ["textDocument/publishDiagnostics"] = function() end,
            },
        })

    end,
}
