return {
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
}
