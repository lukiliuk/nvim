return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'hrsh7th/nvim-cmp', -- Autocompletion plugin,
        'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp,
        'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
        'L3MON4D3/LuaSnip', -- Snippets plugin
    }, 
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tsserver",
                    "pyright",
                    "cssls",
                    -- "gopls",
                    -- "clangd",
                    "html",
                    "angularls"
                }
            })
        require('lspconfig.ui.windows').default_options.border = 'single'
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local lspconfig = require("lspconfig")
        lspconfig.tsserver.setup({
            capabilities = capabilities
        })
        lspconfig.html.setup({
            capabilities = capabilities
        })
        lspconfig.lua_ls.setup({
            capabilities = capabilities
        })
        lspconfig.pyright.setup({
            capabilities = capabilities
        })
        lspconfig.cssls.setup({
            capabilities = capabilities
        })
        lspconfig.angularls.setup({
            capabilities = capabilities
        })

        vim.diagnostic.config {     
            float = { border = "rounded" }, 
        }

        end
        
    
}

