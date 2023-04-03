local status_ok, nvim_comment = pcall(require, "nvim_comment")

if not status_ok then
    print("Failed to load nvim-comment")
end

nvim_comment.setup({
    comment_empty = false
})
