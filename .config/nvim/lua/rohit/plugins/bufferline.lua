return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    config = function()
        local bufferline = require("bufferline");
        bufferline.setup {
            options = {
                style_preset = {
                    bufferline.style_preset.no_italic,
                    -- bufferline.style_preset.minimal
                },
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                },
                indicator = {
                    style = 'none'
                }
            }
        }
    end,
}
