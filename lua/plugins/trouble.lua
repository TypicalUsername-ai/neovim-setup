return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>tt", "<cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>", desc = "Open trouble for current buffer" },
		{ "<leader>tq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
	},
	opts = {
		position = "right",
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
