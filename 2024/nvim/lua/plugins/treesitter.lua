
 return { 
   'nvim-treesitter/nvim-treesitter', 
   build = ':TSUpdate',
   config = function()
      -- Treesitter Setup 
      local tree_config = require('nvim-treesitter.configs')
      tree_config.setup({
        ensure_installed = {
          "lua",
          "luadoc",
          "vim",
          "vimdoc",
          "bash",
          "javascript",
          "ruby",
          "sql",
          "swift",
          "tmux",
          "typescript"
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
   end
 }
