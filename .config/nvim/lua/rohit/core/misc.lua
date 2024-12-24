-- Set of misc settings, commands, and keymaps
-- Also used to declare global functions

-- Toggle Twilight
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>Twilight<cr>", { noremap = true, silent = true, desc = "[T]oggle [T]wilight" })

-- Prevent FugitiveObject from getting unlisted on bufleave
vim.api.nvim_create_autocmd('User', {
  pattern = 'FugitiveObject',
  callback = function()
    vim.opt_local.bufhidden = ''
  end
})

-- Prevent auto adding comment on new line
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- Extract text from visual selection
function vim.getVisualSelection()
    local current_clipboard_content = vim.fn.getreg('"')
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg('v')
    vim.fn.setreg('v', {})
    vim.fn.setreg('"', current_clipboard_content)
    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ''
    end
end

-- Highlight cursorline only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    if vim.w.auto_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_cursorline = nil
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    if vim.wo.cursorline then
      vim.w.auto_cursorline = true
      vim.wo.cursorline = false
    end
  end,
})
