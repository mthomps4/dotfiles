return { 
  'navarasu/onedark.nvim', 
  priority = 1000,
  config = function()  
    require('onedark').setup({
      style = 'darker',
      code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'italic,bold',
        strings = 'none',
        variables = 'none'
      }
    })
    require('onedark').load()
  end
}
