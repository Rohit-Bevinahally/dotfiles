local theme = {
  fill = 'TabLineFill',
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}

return {
  'nanozuki/tabby.nvim',
  config = function()
      require('tabby.tabline').set(function(line)
        return {
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep('', hl, theme.fill),
              tab.in_jump_mode() and { ' ' .. tab.jump_key() .. ' ', hl = hl } or (tab.is_current() and '' or ''),
              tab.number(),
              tab.name(),
              tab.close_btn(''),
              line.sep('', hl, theme.fill),
              hl = hl,
              margin = ' ',
            }
          end),
          line.spacer(),
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
              line.sep('', theme.win, theme.fill),
              win.is_current() and '' or '',
              win.buf_name(),
              line.sep('', theme.win, theme.fill),
              hl = theme.win,
              margin = ' ',
            }
          end),
          {
            line.sep('', theme.tail, theme.fill),
            { '  ', hl = theme.tail },
          },
          hl = theme.fill,
        }
      end)

    -- Keybinds
    vim.keymap.set('n', '<leader>tj', '<cmd>Tabby jump_to_tab<cr>', { desc = '[T]abby [J]ump' })
    vim.keymap.set('n', '<leader>kt', '<cmd>Tabby pick_window<cr>', { desc = 'Window picker' })
    vim.keymap.set('n', '<leader>tr', function()
      vim.ui.input({ prompt = 'Rename Tab' }, function(input)
        if input then
          require('tabby.feature.tab_name').set(0, input)
        end
      end)
    end, { desc = '[T]abby [R]ename' })
  end,
}
