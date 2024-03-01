-- FROM lazy.nvim readme @00.01.2024 [https://github.com/folke/lazy.nvim?tab=readme-ov-file]
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

-- FROM lazy.nvim lower @01.01.2024 [https://github.com/folke/lazy.nvim?tab=readme-ov-file] 
require("lazy").setup({
    spec = {
        { import = "plugins" }
    }
}) 



