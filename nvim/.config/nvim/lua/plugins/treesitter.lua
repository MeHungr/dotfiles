return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            -- Install parsers
            require("nvim-treesitter").install({ "lua", "java", "go", "python", "c" }):wait(300000)

            -- Enable highlighting per filetype
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "lua", "java", "go", "python", "c" },
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },
}
