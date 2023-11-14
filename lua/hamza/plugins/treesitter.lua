local treesitter_configs = require("nvim-treesitter.configs")

vim.defer_fn(function()
    treesitter_configs.setup {
      ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },
      auto_install = true,
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    }
  end,
  0
)
