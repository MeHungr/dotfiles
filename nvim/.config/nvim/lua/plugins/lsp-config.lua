return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "bashls", "ansiblels", "jdtls", "gopls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local servers = {
                lua_ls = {},
                jdtls = {},
                bashls = {},
                ansiblels = {},
                clangd = {},
                gopls = {
                    settings = {
                        gopls = {
                            ["ui.inlayhint.hints"] = {
                                parameterNames = true,
                            },
                        },
                    },
                },
            }

            for server, config in pairs(servers) do
                config.capabilities = capabilities
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end

            vim.keymap.set("n", "<leader>ci", vim.lsp.buf.hover, { desc = "Show hover info window" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
                { desc = "Show code actions (vscode ctrl + .)" })
            vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show hover error info" })
            vim.keymap.set("n", "<leader>ch", function()
                local bufnr = 0
                local is_on = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
                vim.lsp.inlay_hint.enable(not is_on, { bufnr = bufnr })
            end, { desc = "Toggle inlay hints (current buffer)" })
        end,
    },
}
