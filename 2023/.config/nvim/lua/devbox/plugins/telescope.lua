-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg", 
      "--color=never", 
      "--no-heading", 
      "--with-filename", 
      "--line-number", 
      "--column", 
      "--smart-case",
      "--hidden",
      "--no-ignore",
      "--glob=!**/.git/*",
      "--glob=!**/node_modules/*",
      "--glob=!**/.next/*",
      "--glob=!yarn.lock",
    },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
        ["jk"] = "close"
      },
      n = {
        ["jk"] = "close"
      }
    },
    pickers = {
      find_files = {
        find_command = {"rg", "--files", "--hidden", "--ignore", "-u", "--glob=!**/.git/*", "--glob=!**/node_modules/*", "--glob=!**/.next/*", "--glob=!yarn.lock",},    
      }
    },
    extensions = {},
  },
})

telescope.load_extension("fzf")
