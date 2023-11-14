local gitsigns = require("gitsigns")

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
      vim.keymap.set("n", "<leader>gd", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview git hunk" })
    end,
  }
)
