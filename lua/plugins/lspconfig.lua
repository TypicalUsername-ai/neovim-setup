return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    },
    keys = {
        {'<leader>d', vim.diagnostic.open_float, desc = "Open float diagnostic lspconfig" },
        {'<leader>k', vim.lsp.buf.definition, opts, desc = "Peek definition" }
    },
    setup = function()
        require('mason').setup()
        require('mason-lspconfig').setup()

        local lspconfig = require('lspconfig')

        lspconfig.lua_ls.setup({})
        lspconfig.tsserver.setup({})
    end
}
