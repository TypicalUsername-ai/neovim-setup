return {
	"neovim/nvim-lspconfig",
	dependencies = {},
	lazy = false,
	keys = {
		{ "K", vim.lsp.buf.hover(), opts, mode = "n" },
		{ "gd", vim.lsp.buf.definition(), desc = "", opts, mode = "n" },
		{ "gD", vim.lsp.buf.declaration(), desc = "", opts, mode = "n" },
		{ "gi", vim.lsp.buf.implementation(), desc = "", opts, mode = "n" },
		{ "go", vim.lsp.buf.type_definition(), desc = "", opts, mode = "n" },
		{ "gr", vim.lsp.buf.references(), desc = "", opts, mode = "n" },
		{ "gs", vim.lsp.buf.signature_help(), desc = "", opts, mode = "n" },
		{ "<F2>", vim.lsp.buf.code_action(), desc = "", opts, mode = "n" },
	},
	config = function()
		local lspconfig = require("lspconfig")
		-- Next, you can provide a dedicated handler for specific servers.
		-- For example, a handler override for the `rust_analyzer`:

		-- Rust-specific setup
		lspconfig.rust_analyzer.setup({
			-- Specify that it should only attach to Rust files
			filetypes = { "rust" },
			on_attach = function(client, bufnr)
				-- Optional: custom on_attach configuration
			end,
			settings = {
				-- Rust analyzer specific settings if needed
			},
		})

		-- Deno Js/Ts setup
		lspconfig.denols.setup({
			root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "package.json"),
			init_options = {
				lint = true, -- Enable linting
				unstable = true, -- Enable unstable APIs
			},
			settings = {
				["deno"] = {
					enable = true, -- Enable Deno support
					lint = true, -- Enable linting
					suggestions = {
						autoImports = true, -- Enable auto-import suggestions
					},
				},
			},
			filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
		})

		lspconfig.ruff.setup({
			root_dir = lspconfig.util.root_pattern("pyproject.toml", ".git", "requirements.txt"),
			init_options = {
				-- lint = true, -- Enable linting
				-- unstable = true, -- Enable unstable APIs
			},

			settings = {
				ruff = {
					-- Enable Ruff as a formatter
					format = true,
					-- Respect pyproject.toml configuration
					respectPyprojectToml = true,
				},
			},
			filetypes = { "python" },
		})
	end,
}
