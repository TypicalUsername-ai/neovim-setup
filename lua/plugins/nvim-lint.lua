return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile", "BufWritePost" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			yaml = { "actionlint" },
			-- lua = { "luacheck" },
			markdown = { "vale" },
			latex = { "vale" },
			text = { "vale" },
			javascript = { "deno" },
			typescript = { "deno" },
			javascriptreact = { "deno" },
			typescriptreact = { "deno" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
