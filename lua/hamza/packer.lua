vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

    -- Theme
    use { "bluz71/vim-moonfly-colors", as = "moonfly" }

    -- Fuzzy finder
    use {
        "nvim-telescope/telescope.nvim",
        tag="0.1.1",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use("theprimeagen/harpoon")

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    }

    -- lsp
    use {
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{"neovim/nvim-lspconfig"},             -- Required
			{"williamboman/mason.nvim"},           -- Optional
			{"williamboman/mason-lspconfig.nvim"}, -- Optional

			-- Autocompletion
			{"hrsh7th/nvim-cmp"},         -- Required
			{"hrsh7th/cmp-nvim-lsp"},     -- Required
			{"hrsh7th/cmp-buffer"},       -- Optional
			{"hrsh7th/cmp-path"},         -- Optional
			{"saadparwaiz1/cmp_luasnip"}, -- Optional
			{"hrsh7th/cmp-nvim-lua"},     -- Optional

            -- Formatting and linting
            {"jose-elias-alvarez/null-ls.nvim"},
            {"jay-babu/mason-null-ls.nvim"},

			-- Snippets
			{"L3MON4D3/LuaSnip"},             -- Required
			{"rafamadriz/friendly-snippets"}, -- Optional
		}
	}
    use({"nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"}})

    -- git
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")
    use("terrortylor/nvim-comment")
end)
