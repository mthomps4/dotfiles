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
opt.clipboard:append("unnamedplus")

-- splits 
opt.splitright = true
opt.splitbelow = true

-- keywords
opt.iskeyword:append("-")
opt.iskeyword:append("_")

