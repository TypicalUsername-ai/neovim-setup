
vim.opt.hlsearch = false -- Disable seeing prev search pattern
vim.opt.incsearch = true -- show search while typing
vim.opt.termguicolors = true -- tries to force colored terminal

-- TAB choices to make it 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- disable wrapping
vim.opt.wrap = false

-- SWAP and UNDO commands
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Setting timeout to wait for next command
vim.opt.timeoutlen = 250



