-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- Add plugins here...  

  -- lua funciton helpers
  use("nvim-lua/plenary.nvim")

  -- Packer can manage packer
  use("wbthomason/packer.nvim")

  -- colorscheme...
  use('rmehri01/onenord.nvim')

  -- tmux & window
  use("christoomey/vim-tmux-navigator")
  use("szw/vim-maximizer") -- pop in/out

  -- general
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

  -- explore
  use("nvim-tree/nvim-tree.lua")
  
  -- icons 
  use("kyazdani42/nvim-web-devicons") -- similar to VSCode Icons 

  -- status line
  use("nvim-lualine/lualine.nvim")

  -- Telescope FZF 
  -- -- Deps 
  use("BurntSushi/ripgrep")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("sharkdp/fd")
  use("nvim-treesitter/nvim-treesitter")
  -- Main
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- autocomplete 
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer") -- recommend from buffer 
  use("hrsh7th/cmp-path") -- recommend file paths 

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets
 

  -- ...end plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
