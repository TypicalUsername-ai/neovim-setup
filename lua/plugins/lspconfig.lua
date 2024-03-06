return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    },
    lazy = false,
    keys = {
        {'<leader>d', vim.diagnostic.open_float, desc = "Open float diagnostic lspconfig" },
        {'<leader>k', vim.lsp.buf.definition, opts, desc = "Peek definition" }
    },
    config = function()
        require('mason').setup()
        require("mason-lspconfig").setup_handlers({
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function (server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {}
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
            -- ["rust_analyzer"] = function ()
            --    require("rust-tools").setup {}
        -- end
    })
    end
}
