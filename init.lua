-- FROM lazy.nvim readme @01.01.2024 [https://github.com/folke/lazy.nvim?tab=readme-ov-file]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- @01.03.2024 setting LEADER to <space>

-- @01.03.2024 ==> PLUGINS list for lazy nvim
local plugins = {
	"https://github.com/nvim-lualine/lualine.nvim", -- @01.03.2024 status line lualine plugin
}


-- FROM lazy.nvim lower @01.01.2024 [https://github.com/folke/lazy.nvim?tab=readme-ov-file]
require("lazy").setup(plugins, opts)

-- @01.03.2024 requiring lualine from lazy.nvim git
require("lualine").setup({
  sections = {
    lualine_x = {
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = { fg = "#ff9e64" },
      },
    },
  },
})

