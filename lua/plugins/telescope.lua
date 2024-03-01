return { "https://github.com/nvim-telescope/telescope.nvim", -- @01.03.24 Telescope for file swapping
		dependencies = { "https://github.com/nvim-lua/plenary.nvim" }, -- 01.03.24 plenary for concurrent util for telescope deps
	    keys = {
            {"<leader>f", "<cmd>Telescope git_files<cr>", desc = "File finder"},
            {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find all files"}
        }
    }
