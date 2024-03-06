return {
   'williamboman/mason.nvim',
   opts = {},
   lazy = false, --make sure mason is working from the get go
    keys = {
        {'<leader>m', '<cmd>Mason<cr>', desc = 'Open mason'}
    }
}
