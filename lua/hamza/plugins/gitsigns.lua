local status, gitsigns = pcall(require, "gitsigns")
if not status then
  print("Failed to import gitsigns")
end

gitsigns.setup(
    {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        vim.keymap.set("n", "<leader>gd", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview git hunk" })
      end,
    }
)
