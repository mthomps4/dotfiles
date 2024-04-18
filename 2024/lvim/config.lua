-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
-- THEME
lvim.plugins = {
  "navarasu/onedark.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.completion.spell,
          null_ls.builtins.diagnostics.rubocop,
          null_ls.builtins.formatting.rubocop,
          null_ls.builtins.formatting.htmlbeautifier,
          null_ls.builtins.formatting.prettier,
          require("none-ls.diagnostics.eslint_d"),
        },
      })
    end
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   config = function()
  --     require('mason-lspconfig').setup({
  --       ensure_installed = {
  --         "lua_ls",
  --         "tsserver",
  --         "sqlls",
  --         "html",
  --         "tailwindcss",
  --         "solargraph",
  --       },
  --       automatic_installation = true,
  --     })
  --   end
  -- },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.html.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.sqlls.setup({})
      lspconfig.solargraph.setup({})

      -- Keybindings
      -- lvim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      -- lvim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      -- lvim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          width = 30,
        },
        buffers = {
          follow_current_file = true,
        },
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules"
            },
            never_show = {
              ".DS_Store",
              "thumbs.db"
            },
          },
        },
      })
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  "mrjones2014/nvim-ts-rainbow",
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
}

lvim.builtin.which_key.mappings["e"] = {
  "<cmd>NeoTreeRevealToggle<CR>", "Explorer"
}
-- vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal toggle <CR>')
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree

require('onedark').setup {
  style = 'deep'
}
require('onedark').load()

lvim.colorscheme = "onedark"
-- lvim.colorscheme = "catppuccin-mocha"

-- rainbow brackets
lvim.builtin.treesitter.rainbow.enable = true;

-- terminal toggle
lvim.builtin.terminal.open_mapping = "<c-t>"

-- Keybinds
-- quick normal mode
lvim.keys.insert_mode["jk"] = "<ESC>";

-- fat finger
lvim.keys.command_mode["WQ"] = "wq";
lvim.keys.command_mode["Wq"] = "wq";
lvim.keys.command_mode["wQ"] = "wq";
lvim.keys.command_mode["W"] = "w";
lvim.keys.command_mode["Q"] = "q";
lvim.keys.command_mode["Q!"] = "q!";

-- FORMATTING
lvim.format_on_save.enabled = true

-- global search
lvim.keys.normal_mode["<C-f>"] = "<Cmd>Telescope live_grep<CR>";

-- options
vim.opt.smartcase = true;
vim.opt.ignorecase = true;
vim.opt.splitright = true;
vim.opt.splitbelow = true;
-- backspace keeps going up a line
vim.opt.backspace = "indent,eol,start";

-- lvim.lsp.buffer_mappings.normal_mode['H'] = { vim.lsp.buf.hover, "Show documentation" }
