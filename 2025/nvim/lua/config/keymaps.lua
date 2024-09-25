-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- quick normal mode
vim.keymap.set({ "i", "v" }, "jk", "<ESC>", { silent = true })

-- fat finger
vim.keymap.set("c", "WQ", "wq")
vim.keymap.set("c", "Wq", "wq")
vim.keymap.set("c", "wQ", "wq")
vim.keymap.set("c", "W", "w")
vim.keymap.set("c", "Q", "q")
vim.keymap.set("c", "Q!", "q!")
