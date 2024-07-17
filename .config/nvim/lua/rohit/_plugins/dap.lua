return {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    -- fancy UI for the debugger
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
      keys = {
        { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
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

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },

    "mxsdev/nvim-dap-vscode-js",

    {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
  },

  keys = {
    { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

  config = function()
      require("dap-vscode-js").setup({
          debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
          adapters = { 'pwa-node', 'pwa-chrome', 'node-terminal' },
      })
      local js_based_languages = { "typescript", "javascript" }

      for _, language in ipairs(js_based_languages) do
          require("dap").configurations[language] = {
              {
                  type = "pwa-chrome",
                  request = "attach",
                  name = "Launch Chrome with debugger",
                  -- sourceMaps = true,
                  -- resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**"},
                  -- skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
                  -- webRoot = "${workspaceFolder}",
                  url = "https://localhost.corp.adobe.com:3000",
              },
              {
                  type = "pwa-node",
                  request = "launch",
                  name = "Launch current file in new node process",
                  program = "${file}",
              },
              {
                  type = "pwa-node",
                  request = "attach",
                  name = "Attach to existing node --inspect process",
                  processId = require('dap.utils').pick_process,
                  sourceMaps = true,
                  -- resolve source maps in nested locations while ignoring node_modules
                  resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**"},
                  skipFiles = { "${workspaceFolder}/proj/web/node_modules/**/*.js" },
                  cwd = "${workspaceFolder}/proj/web/src",
              },
          }
      end
  end,
}
