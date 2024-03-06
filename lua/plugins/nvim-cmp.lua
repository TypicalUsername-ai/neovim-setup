local C = { 'https://github.com/hrsh7th/nvim-cmp', -- neovim completion engine
    dependencies = {
        'https://github.com/hrsh7th/cmp-buffer', -- Buffer autocompletes
        'https://github.com/hrsh7th/cmp-path', -- Path / filename completions
        'https://github.com/hrsh7th/cmp-nvim-lua', -- For nvim configs with lua
        'https://github.com/hrsh7th/cmp-nvim-lsp', -- Neovim LSP integration
        'https://github.com/L3MON4D3/LuaSnip',-- LuaSnip as a snippet engine
        'https://github.com/saadparwaiz1/cmp_luasnip', -- cmp-luasnip for support
        'https://github.com/neovim/nvim-lspconfig' -- lspconfig for capabilities
    },
}

C.config = function()
	local cmp = require("cmp")
	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
        experimental = {
            -- disable native menu
            native_menu = false,
            -- Add ghost text autocompletions
            ghost_text = true
        },
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" }, -- For luasnip users.
			-- { name = "orgmode" },
		}, {
			{ name = "buffer" },
			{ name = "path" },
		}),
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('lspconfig')['typescript'].setup({
        capabilities = capabilities
    })

    require('lspconfig')['lua'].setup({
        capabilibilities = capabilities
    })
end

return C
