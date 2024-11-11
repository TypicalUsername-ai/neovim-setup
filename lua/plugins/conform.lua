return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				yaml = { "prettier" },
                nix = { "nixfmt" },
                rust = { "rustfmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 750,
			},
		})

		vim.keymap.set("n", "<leader>F", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 750,
			})
		end, { desc = "format file" })
	end,
}
