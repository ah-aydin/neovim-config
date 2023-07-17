local keymap = vim.keymap

vim.g.mapleader = " "
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- To move dem visual mode block around
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- For centering the screen when moving up and down the file
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- For centering the screen when moving up and down with paragraph jumps
keymap.set("n", "{", "{zz")
keymap.set("n", "}", "}zz")

-- For centering the screen when jumping to search results
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

keymap.set("x", "<leader>p", "\"_dp")

-- Store stuff in the system buffer instead of the editor buffer
keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")

-- I am too used to Ctrl-C, so just in case mapping
keymap.set("i", "<C-c>", "<Esc>")

-- Worst place in the universe
keymap.set("n", "Q", "<nop>")

-- New window/buffer
keymap.set("n", "<C-w><C-l>", ":rightbelow vnew<CR>")
keymap.set("n", "<C-w><C-h>", ":leftabove vnew<CR>")
keymap.set("n", "<C-w><C-k>", ":new<CR>")
keymap.set("n", "<C-w><C-j>", ":belowright new<CR>")
-- Move between window/buffer
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")

-- Useless mappings
keymap.set("n", "[[", "<NOP>")
keymap.set("n", "]]", "<NOP>")

