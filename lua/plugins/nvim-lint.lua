return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			yaml = { "actionlint" },
			-- lua = { "luacheck" },
			markdown = { "vale" },
			latex = { "vale" },
			text = { "vale" },
			javascript = { "oxlint" },
			typescript = { "oxlint" },
			javascriptreact = { "oxlint" },
			typescriptreact = { "oxlint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
	init = function()
		require("lint").linters.oxlint = {
			name = "oxlint",
			cmd = "oxlint",
			stdin = false,
			args = { "--format", "unix" },
			stream = "stdout",
			ignore_exitcode = true,
			parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
				source = "oxlint",
				severity = vim.diagnostic.severity.WARN,
			}),
		}
	end,
}
