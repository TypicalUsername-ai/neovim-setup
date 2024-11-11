return {
	"stevearc/oil.nvim",
	opts = {
        view_options = {
            show_hidden = true,
        },
    },
	keys = {
		{ "<leader>e", "<cmd>Oil<cr>", desc = "Open oil browser" },
		{ "-", "<cmd>Oil<cr>", desc = "Open oil browser" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
