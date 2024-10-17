return {
	"neovim/nvim-lspconfig",
	dependencies = {
	},
	lazy = false,
	keys = {
		{ "<leader>d", vim.diagnostic.open_float, desc = "Open float diagnostic lspconfig" },
		{ "<leader>k", vim.lsp.buf.definition, opts, desc = "Peek definition" },
	},
	config = function()
			-- Next, you can provide a dedicated handler for specific servers.
			-- For example, a handler override for the `rust_analyzer`:
			-- ["rust_analyzer"] = function ()
			--    require("rust-tools").setup {}
			-- end
		})
	end,
}
