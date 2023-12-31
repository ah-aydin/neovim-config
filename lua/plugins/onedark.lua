return {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- your optional config goes here, see below.
    require('onedark').setup({
      style = 'darker',
      code_style = {
        keywords = 'bold',
      },
    })
    require('onedark').load()
  end,
}
