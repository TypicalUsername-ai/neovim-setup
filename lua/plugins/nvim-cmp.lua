return { 'https://github.com/hrsh7th/nvim-cmp', -- neovim completion engine
    dependencies = {
        'https://github.com/hrsh7th/cmp-buffer', -- Buffer autocompletes
        'https://github.com/hrsh7th/cmp-path', -- Path / filename completions
        'https://github.com/hrsh7th/cmp-nvim-lua', -- For nvim configs with lua
        'https://github.com/hrsh7th/cmp-nvim-lsp' -- Neovim LSP integration
    },
    keys = {
    },
    opts = {
        sources = {
            { name = 'nvim_lua' },
            { name = 'nvim_lsp' },
            { name = 'path' },
            { name = 'buffer', keyword_length = 5 }
        },
        experimental = {
            -- Different kind of menu
            native_menu = false,
            -- Ghost text not inserted in the buffer for snippets
            ghost_text = true
        }
    }
}
