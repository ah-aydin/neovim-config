local status_ok, tree = pcall(require, "nvim-tree")


if not status_ok then
    print("Failed to load lualine")
    return
end

tree.setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    }
})

vim.keymap.set("n", "<leader>[", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>]", ":NvimTreeFocus<CR>")
