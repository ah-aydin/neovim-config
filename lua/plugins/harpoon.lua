return {
  'theprimeagen/harpoon',
  config = function()
    local harpoon_mark = require('harpoon.mark')
    local harpoon_ui = require('harpoon.ui')

    vim.keymap.set('n', '<leader>a', harpoon_mark.add_file)
    vim.keymap.set('n', '<leader>e', harpoon_ui.toggle_quick_menu)

    vim.keymap.set('n', '<M-a>', function() harpoon_ui.nav_file(1) end)
    vim.keymap.set('n', '<M-s>', function() harpoon_ui.nav_file(2) end)
    vim.keymap.set('n', '<M-d>', function() harpoon_ui.nav_file(3) end)
    vim.keymap.set('n', '<M-f>', function() harpoon_ui.nav_file(4) end)
    vim.keymap.set('n', '<M-g>', function() harpoon_ui.nav_file(5) end)
    vim.keymap.set('n', '<M-h>', function() harpoon_ui.nav_file(6) end)
    vim.keymap.set('n', '<M-j>', function() harpoon_ui.nav_file(7) end)
    vim.keymap.set('n', '<M-k>', function() harpoon_ui.nav_file(8) end)
    vim.keymap.set('n', '<M-l>', function() harpoon_ui.nav_file(9) end)
    vim.keymap.set('n', '<M-;>', function() harpoon_ui.nav_file(10) end)
  end
}
