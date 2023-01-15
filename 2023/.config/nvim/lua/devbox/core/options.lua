local opt = vim.opt -- for conciseness 

-- line numbers 
opt.relativenumber = false
opt.number = true

-- tabs and indents 
opt.tabstop = 2 
opt.shiftwidth = 2 
opt.expandtab = true
opt.autoindent = true

--line wrapping 
opt.wrap = false

-- search 
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance 
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- if vim.fn.has('wsl') == 1 then
--     vim.api.nvim_create_autocmd('TextYankPost', {
--        group = vim.api.nvim_create_augroup('Yank', { clear = true }),
--        callback = function()
--            vim.fn.system('clip.exe', vim.fn.getreg('"'))
--         end,
--     })
-- end

-- splits 
opt.splitright = true
opt.splitbelow = true

-- keywords
opt.iskeyword:append("-")
opt.iskeyword:append("_")

