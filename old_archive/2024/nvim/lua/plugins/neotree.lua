return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", 
    "MunifTanjim/nui.nvim",
  },
  config = function() 
    -- Neotree setup 
    vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>')
  end
}
