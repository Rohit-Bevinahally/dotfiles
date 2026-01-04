-- Set of misc settings, commands, and keymaps
-- Also used to declare global functions

-- Prevent auto adding comment on new line
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- Change buffer to read-only mode with ANSI color codes rendered
function Ansi_colorize()
  vim.wo.relativenumber = false
  vim.wo.statuscolumn = ""
  vim.wo.signcolumn = "no"
  vim.opt.listchars = { space = " " }

  local buf = vim.api.nvim_get_current_buf()

  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  while #lines > 0 and vim.trim(lines[#lines]) == "" do
    lines[#lines] = nil
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})

  vim.api.nvim_chan_send(vim.api.nvim_open_term(buf, {}), table.concat(lines, "\r\n"))
  vim.keymap.set("n", "q", "<cmd>qa!<cr>", { silent = true, buffer = buf })
  vim.api.nvim_create_autocmd("TextChanged", { buffer = buf, command = "normal! G$" })
  vim.api.nvim_create_autocmd("TermEnter", { buffer = buf, command = "stopinsert" })
end

vim.keymap.set("n", "<leader>co", "<cmd>lua Ansi_colorize()<cr>", { silent = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Set python3 path for faster startup
vim.g.python3_host_prog = os.getenv("HOME") .. '/.pyenv/shims/python3'

-- Trim whitespace in buffer
vim.keymap.set('n', '<leader>wt', function()
  local save_cursor = vim.api.nvim_win_get_cursor(0)
  vim.cmd('%s/\\s\\+$//e')
  vim.api.nvim_win_set_cursor(0, save_cursor)
end, { desc = '[T]rim [W]hitespace' })

-- Smart close for buffers, splits, quickfix list
vim.api.nvim_set_keymap('n', '<leader>q', '', {
  noremap = true,
  silent = true,
  callback = function()
    local quickfix_open = false
    for _, win in ipairs(vim.fn.getwininfo()) do
      if win.quickfix == 1 then
        quickfix_open = true
        break
      end
    end

    if quickfix_open then
      vim.cmd('cclose')
      return
    end

    if vim.fn.winnr('$') > 1 then
      vim.cmd('close')
      return
    end

    require('snacks').bufdelete()
  end,
})

-- Custom filetype mapping
vim.filetype.add({
    extension = {
        ['mp'] = 'python'
    }
})
