require'nvim-treesitter.configs'.setup {
	ensure_installed = { "help", "c", "javascript", "typescript", "rust", "lua", "vim", "help", "query" },

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
