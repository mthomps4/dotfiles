-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- THEME 
lvim.plugins = {
  "navarasu/onedark.nvim",
  "mrjones2014/nvim-ts-rainbow",
}

require('onedark').setup {
  style = 'deep'
}
require('onedark').load()

lvim.colorscheme = "onedark"

-- rainbow brackets
lvim.builtin.treesitter.rainbow.enable = true;

-- terminal toggle
lvim.builtin.terminal.open_mapping = "<c-t>"

-- X closes a buffer
--   lvim.keys.normal_mode["<S-x>"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<leader>x"] = ":wq<CR>"

-- quick normal mode
lvim.keys.insert_mode["jk"] = "<ESC>";

-- fat finger
lvim.keys.command_mode["WQ"] = "wq";
lvim.keys.command_mode["Wq"] = "wq";
lvim.keys.command_mode["wQ"] = "wq";
lvim.keys.command_mode["W"] = "w";
lvim.keys.command_mode["Q"] = "q";
lvim.keys.command_mode["Q!"] = "q!";

-- global search
-- lvim.keys.normal_mode["<C-f>"] = "<Cmd>Telescope live_grep<CR>";

-- options
vim.opt.smartcase = true;
vim.opt.ignorecase = true;
vim.opt.splitright = true;
vim.opt.splitbelow = true;
-- backspace keeps going up a line
vim.opt.backspace = "indent,eol,start";


-- lvim.lsp.installer.setup.ensure_installed = {
--   "lua_ls",
--   "tailwindcss",
--   "tsserver",
--   "prismals",
--   "ruby_ls",
--   "standardrb",
--   "html",
-- }

-- local linters = require "lvim.lsp.null-ls.linters"
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- local code_actions = require "lvim.lsp.null-ls.code_actions"

-- linters.setup {
--   { command = "eslint_d", filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" } }
-- }

-- code_actions.setup {
--   { exe = "eslint_d", filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" } },
-- }

-- formatters.setup {
--   {
--     exe = "prettier",
--     filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "json", "css", "scss" },
--   },
-- }


