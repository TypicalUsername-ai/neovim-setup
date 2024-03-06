-- @01.03.2024 ==> PLUGINS list for lazy nvim
return {
	"https://github.com/nvim-lualine/lualine.nvim", -- @01.03.2024 status line lualine plugin
    opts = {
        theme = 'tokyonight',
        sections = {
            lualine_x = {
            {
                require("lazy.status").updates,
                cond = require("lazy.status").has_updates,
                color = { fg = "#ff9e64" },
            },
        },
    },
    }

}
