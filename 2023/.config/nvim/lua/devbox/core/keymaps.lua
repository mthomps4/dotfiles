vim.g.mapleader = " " 

local keymap = vim.keymap

-- local path = vim.loop.cwd() .. "/.git"
-- local ok, err = vim.loop.fs_stat(path)
-- local isGitDir = ok and true or false 

-- if (isGitDir == true) then
-- 	print(".git directory found")
--   return
-- end

-- general keymaps 
keymap.set("i", "jk", "<ESC>")

-- fat finger
keymap.set("c", "Wq", "wq")
keymap.set("c", "WQ", "wq")
keymap.set("c", "wQ", "wq")

keymap.set("c", "W", "w")
keymap.set("c", "Q", "q")
keymap.set("c", "Q!", "q!")

keymap.set("n", "<leader>w", ":w<CR>")

-- clear highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- don't copy to register on cut 
keymap.set("n", "x", '"_x')

-- split management 
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically 
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally 
keymap.set("n", "<leader>se", "<C-w>=") -- equal width 
keymap.set("n", "<leader>sx", ":close<CR>") -- close split 

keymap.set("n", "<leader>tn", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tt", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tr", ":tabp<CR>") -- previous tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close tab

keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")

-- explore
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope 
local builtin = require('telescope.builtin')

-- https://github.com/nvim-telescope/telescope.nvim#pickers
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', ":Telescope find_files find_command=rg,--ignore,--hidden,--files,-u,--glob,!**/.git/*,--glob,!**/node_modules/*,--glob,!**/.next/*<CR>")
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ft', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fp', builtin.spell_suggest, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- vscode mimics 
-- keymap.set("i", "<ALT-Left>", "<ESC>b") -- ALT gets viewed as ESC before this hits :shrug:

