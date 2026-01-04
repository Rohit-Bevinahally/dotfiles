vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  },
  root_markers = { '.git' },
})

vim.lsp.enable({
    "luals",
    "clangd",
    "pyright",
    "tsls",
    "copilot",
    "rust-analyzer",
    "gopls",
})

-- Disable diagnostics by default
-- NOTE: Toggle binding for this setting is present in snacks
vim.diagnostic.enable(false)
vim.diagnostic.config({
    virtual_text = {
        severity = {
            max = vim.diagnostic.severity.WARN,
        },
    },
    virtual_lines = {
        severity = {
            min = vim.diagnostic.severity.ERROR,
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
        vim.keymap.set("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "Toggle Inlay Hints" })
    end
})
