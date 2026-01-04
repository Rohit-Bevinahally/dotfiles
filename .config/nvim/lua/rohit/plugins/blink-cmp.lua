return {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    -- optional: provides snippets for the snippet source
    dependencies = {
        'rafamadriz/friendly-snippets',
        "fang2hou/blink-copilot",
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        -- keymap = {
        --     preset = "super-tab",
        --     ["<Tab>"] = {
        --         function(cmp)
        --             if vim.b[vim.api.nvim_get_current_buf()].nes_state then
        --                 cmp.hide()
        --                 return (
        --                     require("copilot-lsp.nes").apply_pending_nes()
        --                     and require("copilot-lsp.nes").walk_cursor_end_edit()
        --                 )
        --             end
        --             if cmp.snippet_active() then
        --                 return cmp.accept()
        --             else
        --                 return cmp.select_and_accept()
        --             end
        --         end,
        --         "snippet_forward",
        --         "fallback",
        --     },
        -- },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- Will be removed in a future release
            use_nvim_cmp_as_default = false,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        completion = {
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                },
            },
            menu = {
                border = 'rounded',
                scrollbar = false,
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = { border = 'rounded' }
            },
        },
        signature = { window = { border = 'rounded' } },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
            providers = {
                copilot = {
                    name = "copilot",
                    module = "blink-copilot",
                    score_offset = 100,
                    async = true,
                },
            },
        },
    },
    opts_extend = { "sources.default" },
}
