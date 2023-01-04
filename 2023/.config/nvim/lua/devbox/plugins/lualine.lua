local status, lualine = pcall(require, "lualine")
if not status then 
  print("lualine not installed")
  return
end

lualine.setup({
  theme = 'onenord'
})
