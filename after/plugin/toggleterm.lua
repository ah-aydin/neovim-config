local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
    print("Failed to load toggleterm")
    return
end

toggleterm.setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return 70
        end
        return 15
    end,
    open_mapping = [[<C-\>]],
    direction="vertical"
})

vim.keymap.set("n", "tv", ":ToggleTerm direction=vertical<CR>")
vim.keymap.set("n", "th", ":ToggleTerm direction=horizontal<CR>")
vim.keymap.set("n", "tf", ":ToggleTerm direction=float<CR>")
