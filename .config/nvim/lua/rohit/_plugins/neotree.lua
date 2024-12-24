return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
      sources = { "filesystem", "buffers", "git_status" },
      filesystem = {
          bind_to_cwd = false,
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
          filtered_items = {
              hide_dotfiles = false,
          },
      },
      window = {
          mappings = {
              ['\\'] = 'close_window',
              ["l"] = "open",
              ["h"] = "close_node",
              ["<space>"] = "none",
              ["Y"] = {
                  function(state)
                      local node = state.tree:get_node()
                      local path = node:get_id()
                      vim.fn.setreg("+", path, "c")
                  end,
                  desc = "Copy Path to Clipboard",
              },
              ["O"] = {
                  function(state)
                      require("lazy.util").open(state.tree:get_node().path, { system = true })
                  end,
                  desc = "Open with System Application",
              },
              ["P"] = { "toggle_preview", config = { use_float = false } },
          },
      },
      default_component_configs = {
          indent = {
              with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
              expander_collapsed = "",
              expander_expanded = "",
              expander_highlight = "NeoTreeExpander",
          },
          git_status = {
              symbols = {
                  unstaged = "󰄱",
                  staged = "󰱒",
              },
          },
      },
  },
}
