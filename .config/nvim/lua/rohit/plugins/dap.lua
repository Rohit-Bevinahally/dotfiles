return {
    {
      "mfussenegger/nvim-dap",
      keys = {
          { "<leader>df", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
          { "<leader>dF", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
          { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
          { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
          { "<F11>", function() require("dap").step_into() end, desc = "Step Into" },
          { "<F12>", function() require("dap").step_out() end, desc = "Step Out" },
          { "<F8>", function() require("dap").step_over() end, desc = "Step Over" },
          { "<F7>", function() require("dap").continue() end, desc = "Continue" },
      },
      opts = {},
      config = function(_, opts)
          local dap = require("dap")
          -- dap.set_log_level('DEBUG')
          -- dap.adapters.codelldb = {
          --     type = "executable",
          --     command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          -- }
          dap.adapters.lldb = {
              name = 'lldb',
              type = 'executable',
              command = 'xcrun',
              args = { 'lldb-dap' },
          }
          dap.configurations.cpp = {
              {
                  name = "Launch Illustrator",
                  type = "lldb",
                  request = "launch",
                  program = function()
                      local cwd = vim.fn.getcwd() .. '/'
                      local ilst_path = cwd .. "binaries/xcode-universal/release/Adobe Illustrator.app/Contents/MacOS/Adobe Illustrator"
                      if vim.uv.fs_stat(ilst_path) then
                          return ilst_path
                      end

                      return vim.fn.input('Executable path: ', cwd, 'file')
                  end,
                  cwd = '${workspaceFolder}',
                  stopOnEntry = false,
                  preRunCommands = {
                      "settings set target.debug-file-search-paths " .. vim.fn.getcwd() .. '/symbols/macuniversal/release/'
                  },
              },
              {
                  name = "Attach & Wait for Illustrator",
                  type = "lldb",
                  request = "attach",
                  program = function()
                      local cwd = vim.fn.getcwd() .. '/'
                      local ilst_path = cwd .. "binaries/xcode-universal/release/Adobe Illustrator.app/Contents/MacOS/Adobe Illustrator"
                      if vim.uv.fs_stat(ilst_path) then
                          return ilst_path
                      end

                      return vim.fn.input('Executable path: ', cwd, 'file')
                  end,
                  waitFor = true,
                  cwd = "${workspaceFolder}",
                  preRunCommands = {
                      'settings set target.debug-file-search-paths ' .. vim.fn.getcwd() .. '/symbols/macuniversal/release/'
                  },
              },
          }
      end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        keys = {
            { "<leader>di", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
            { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
        },
        opts = {},
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {},
    }
}
