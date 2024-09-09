return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim"
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- lua / general
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        -- Ruby
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,
        --   null_ls.builtins.formatting.erb_lint,
        --   null_ls.builtins.formatting.erb_format,
        --   null_ls.builtins.formatting.htmlbeautifier,
        -- JS/TS
        null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint_d"),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
