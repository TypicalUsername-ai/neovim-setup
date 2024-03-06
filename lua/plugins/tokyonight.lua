return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 100,
    opts = {},
    config = function()
        require('tokyonight').setup({
            style = 'night',
            transparent = 'true'
        })
        require('tokyonight').load()
    end
}
