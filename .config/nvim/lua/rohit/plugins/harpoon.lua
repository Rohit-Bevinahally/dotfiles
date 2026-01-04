return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config  = function()
        harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>jj", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>je", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>ja", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>js", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>jd", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>jf", function() harpoon:list():select(4) end)

        for i = 1, 9 do
            vim.keymap.set("n", "<leader>j" .. i, function() harpoon:list():select(i) end)
        end
    end
}
