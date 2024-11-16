-- LSP keybindings
local on_attach = function(_, bufnr)
  local telescope_builtin = require('telescope.builtin')

  local map = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  map('<leader>lr', '<cmd>lua require(\'telescope.builtin\').lsp_references({})<CR>', '[L]ist [R]eferences')
  map('K', vim.lsp.buf.hover, 'Hover Documentation')
  map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  map(',e', vim.diagnostic.goto_prev, 'Previous diagnostic')
  map('.e', vim.diagnostic.goto_next, 'Next diagnostic')
  map('<leader>od', vim.diagnostic.open_float, '[O]pen [D]iagnostic')

  map('gd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')
  map('gr', telescope_builtin.lsp_references, '[G]oto [R]eferences')
  map('gI', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')

  map('<leader>D', telescope_builtin.lsp_type_definitions, 'Type [D]efinition')
  map('<leader>ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
  map('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  map('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create command `:Fmt` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Fmt', function(_)
    vim.lsp.buf.format()
  end, { desc = '[F]or[m]a[t] current buffer with LSP' })
end

local server_settings = {
  asm_lsp = {
    filetypes = { 'asm' }
  },

  biome = {
    filetypes = { 'javascript', 'json', 'typescript' }
  },

  clangd = {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' }
  },

  cmake_language_server = {
    filetype = { 'cmake' }
  },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
    filetype = { 'lua' }
  },

  rust_analyzer = {
    filetype = { 'rust' }
  },
}

return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  { 'neovim/nvim-lspconfig' },
  { 'j-hui/fidget.nvim',    tag = 'legacy', opts = {} },
  {
    'folke/neodev.nvim',
    config = function()
      require('neodev').setup({})
    end
  },
  -- Setup LSP
  {
    'williamboman/mason-lspconfig',
    config = function()
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup({})

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      mason_lspconfig.setup_handlers({
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = server_settings[server_name],
            filetypes = (server_settings[server_name] or {}).filetypes,
          }
        end,
      })
    end
  },
  -- Setup auto complete
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      require('luasnip.loaders.from_vscode').lazy_load()

      luasnip.config.setup({})
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete({}),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }
      })
    end
  }
}
