local status, treesitter_context = pcall(require, "treesitter-context")
if not status then
  print("Failed to import treesitter-context")
  return
end

treesitter_context.setup {
  seperator = "*",
  max_lines = 2,
  trim_scope = "inner"
}
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg = "#ffffff", bg="#111111" })
