-- https://github.com/rmehri01/onenord.nvim
require('onenord').setup({
  theme = "dark",
  borders = true,
  face_nc = true,
  styles = {
    comments = "NONE",
    strings = "NONE",
    keywords = "NONE",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "underline",
  },
  disable = {
    background = false,
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  -- Inverse highlight for different groups
  inverse = {
    match_paren = false,
  },
  custom_highlights = {}, -- Overwrite default highlight groups
  -- https://github.com/rmehri01/onenord.nvim/blob/main/lua/onenord/colors/onenord.lua
  custom_colors = {
   -- bg = "#222222"
  }, -- Overwrite default colors
})

-- require('lualine').setup {}
