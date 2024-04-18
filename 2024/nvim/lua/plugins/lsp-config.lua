return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup();
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "ruby_ls",
          "sqlls",
          "html",
          "stimulus_ls",
          "tailwindcss",
        },
        automatic_installation = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.ruby_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.stimulus_ls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.sqlls.setup({})

      -- Keybindings 
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end
  },
}
