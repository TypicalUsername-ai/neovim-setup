-- @01.03.2024 ==> PLUGINS list for lazy nvim
return {
	"nvim-lualine/lualine.nvim", -- @01.03.2024 status line lualine plugin
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"linrongbin16/lsp-progress.nvim",
			config = true,
		},
	},
	opts = {
		theme = "tokyonight",
		sections = {
			lualine_c = {
				{
					"filename",
					file_status = true, -- displays file status (readonly status, modified status)
					path = 1, -- relative path
					shorting_target = 40, -- Shortens path to leave 40 space in the window
				},
			},
			lualine_x = {
				{
					function()
						local lint_progress = function()
							local linters = require("lint").get_running()
							if #linters == 0 then
								return "󰦕"
							end
							return "󱉶 " .. table.concat(linters, ", ")
						end

						return require("lsp-progress").progress({
							max_size = 80,
							format = function(messages)
								local bufnr = vim.api.nvim_get_current_buf()
								local active_clients = vim.lsp.get_active_clients({ bufnr = bufnr })
								if #messages > 0 then
									return table.concat(messages, " ")
								end
								local client_names = {}
								for _, client in ipairs(active_clients) do
									if client and client.name ~= "" then
										table.insert(client_names, 1, client.name)
									end
								end
								return table.concat(client_names, "  ") .. " / " .. lint_progress()
							end,
						})
					end,
					icon = { "", align = "right" },
				},
				"diagnostics",
			},
			lualine_y = { "filetype", "encoding", "fileformat" },
			lualine_z = { "location" },
		},
	},
}
