local status, lualine = pcall(require, "lualine")
if not status then
  print("Failed to import lualine")
  return 1
end

lualine.setup {
  options = {
    icons_enabled = false,
    theme = 'ayu_mirage',
  },
}
