local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
    print("Could not import telescope")
    return
end

local builtin_ok, builtin = pcall(require, "telescope.builtin")
if not builtin_ok then
    print("Could not import telescope.builtin")
    return
end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then
    print("Could not import telescope.actions")
    return
end

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fc", builtin.grep_string, {})
vim.keymap.set("n", "<leader>sb", builtin.buffers, {})

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                -- ["<C-q>"] = actions.move_selection_previous,
            }
        }
    }
})
