local telescope_builtin = require("telescope.builtin")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  nmap("<leader>lr", vim.lsp.buf.references, "[L]ist [R]eferences")
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  nmap(",e", vim.diagnostic.goto_prev, "Previous diagnostic")
  nmap(".e", vim.diagnostic.goto_next, "Next diagnostic")
  nmap("<leader>od", vim.diagnostic.open_float, "[O]pen [D]iagnostic")

  nmap("gd", telescope_builtin.lsp_definitions, "[G]oto [D]efinition")
  nmap("gr", telescope_builtin.lsp_references, "[G]oto [R]eferences")
  nmap("gI", telescope_builtin.lsp_implementations, "[G]oto [I]mplementation")

  nmap("<leader>D", telescope_builtin.lsp_type_definitions, "Type [D]efinition")
  nmap("<leader>ds", telescope_builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")


  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")

  -- Create a command `:Fmt` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Fmt", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })
end

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
mason.setup()
mason_lspconfig.setup()

local servers = {
  clangd = {},
  rust_analyzer = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require("neodev").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}
