local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
    print("Failed to import lualine")
    return
end

lualine.setup({
    options = {
        theme = "ayu_mirage"
    }
})
