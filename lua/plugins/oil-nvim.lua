return {
    'stevearc/oil.nvim',
    opts = {},
    keys = {
        {'<leader>e', '<cmd>Oil<cr>', desc = 'Open oil browser' },
        {'-', '<cmd>Oil<cr>', desc = 'Open oil browser'}
    },
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    }
}
