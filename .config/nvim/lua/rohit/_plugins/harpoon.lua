return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>a", function() require('harpoon'):list():add() end },
        { "<leader>he", function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end },

        { "<leader>ha", function() require('harpoon'):list():select(1) end },
        { "<leader>hs", function() require('harpoon'):list():select(2) end },
        { "<leader>hd", function() require('harpoon'):list():select(3) end },
        { "<leader>hf", function() require('harpoon'):list():select(4) end },

        -- Toggle previous & next buffers stored within harpoon list
        { "<leader>hn", function() require('harpoon'):list():prev() end },
        { "<leader>hp", function() require('harpoon'):list():next() end },
    },
    config = function()
        local harpoon = require('harpoon')
        harpoon:setup({})
    end,
}

