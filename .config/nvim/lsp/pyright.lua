return {
    cmd = {
        vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver",
        "--stdio",
    },
    root_markers = { ".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt", ".git" },
    filetypes = { "python" },
    single_file_support = true,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly',
            },
        },
    },
}
