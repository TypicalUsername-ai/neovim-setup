vim.g.mapleader = " " -- @01.03.2024 setting LEADER to <space>

-- Useful normal keymaps
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
vim.keymap.set({ "n", "v" }, "Y", '"+y')
