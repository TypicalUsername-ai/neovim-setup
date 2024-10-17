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

            -- Rust-specific setup
            lspconfig.rust_analyzer.setup {
                -- Specify that it should only attach to Rust files
                filetypes = { "rust" },
                on_attach = function(client, bufnr)
                  -- Optional: custom on_attach configuration
                end,
                settings = {
                  -- Rust analyzer specific settings if needed
                }
              }
            end
	end,
}
