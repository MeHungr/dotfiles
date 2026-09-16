return {
    {
        "tpope/vim-fugitive",

        -- Load at runtime with nvim
        lazy = false,

        -- Keybinds
        keys = {
            -- git status
            {
                "<leader>gs",
                "<cmd>Git<cr>",
                desc = "Git status",
            },

            -- git add --all
            {
                "<leader>gaa",
                "<cmd>Git add --all<cr>",
                desc = "Git add all"
            },

            -- git commit -m
            {
                "<leader>gc",
                "<cmd>Git commit<cr>",
                desc = "Git commit"
            },

            -- git push
            {
                "<leader>gp",
                "<cmd>Git push<cr>",
                desc = "Git push"
            },

            -- git pull
            {
                "<leader>gl",
                "<cmd>Git pull<cr>",
                desc = "Git pull"
            },
        },
    },
}
