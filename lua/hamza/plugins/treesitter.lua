local status, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status then
  print("Failed to import nvim-treesitter.configs")
  return
end

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
