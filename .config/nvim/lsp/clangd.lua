-- Custom code navigator
function run_code_navigator(request_type)
    local function_name = vim.fn.expand("<cword>")
    local function_context = vim.fn.expand("<cWORD>")
    local root_dir = vim.fn.getcwd()
    local current_file = vim.fn.expand("%:p")
    local cli_path = vim.fn.expand("~/repos/CodeNavigator/target/release/code-navigator")

    vim.system(
        {
            cli_path,
            "--root-dir", root_dir,
            "--current-file", current_file,
            "--function-name", function_name,
            "--function-context", function_context,
            "--request-type", request_type or "definition",
        },
        { text = true },
        function(obj)
            if obj.code ~= 0 then
                vim.notify("Command failed with exit code " .. obj.code, vim.log.levels.ERROR)
                return
            end

            local output = vim.trim(obj.stdout)

            local lines = vim.split(output, "\n", { plain = true, trimempty = true })
            if #lines == 0 then
                vim.notify("No output from code navigator", vim.log.levels.ERROR)
                return
            end

            local first_line = lines[1]
            local filename, line, col = first_line:match("^(.-):(%d+):(%d+)$")
            if not filename then
                vim.notify("Could not parse output: " .. first_line, vim.log.levels.ERROR)
                return
            end

            line = tonumber(line)
            col  = tonumber(col)

            vim.schedule(function()
                vim.cmd("edit " .. filename)
                vim.api.nvim_win_set_cursor(0, { line, col })
            end)
        end
    )
end

return {
    cmd = {
        vim.fn.stdpath("data") .. "/mason/bin/clangd",
        "--background-index",
        "--query-driver=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang"
    },
    capabilities = {
        offsetEncoding = "utf-16",
    },
    root_markers = { '.clangd', 'compile_commands.json' },
    filetypes = { 'c', 'cpp' },
    on_attach = function(client, bufnr)
        local roots = {
            [vim.fn.expand("~/repos/illustrator")] = true,
            [vim.fn.expand("~/repos/ilst_tag")] = true,
        }
        if roots[vim.fn.getcwd()] then
            -- Add gs mapping to go to definition using code navigator
            vim.keymap.set("n", "gs", function()
                run_code_navigator("definition")
            end, { desc = "Go to Definition (search based)" })
        end

        vim.keymap.set("n", "<leader>cs", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch between source and header" })
        vim.keymap.set("n", "<leader>ci", "<cmd>ClangdSymbolInfo<CR>", { desc = "Switch between source and header" })
    end
}
