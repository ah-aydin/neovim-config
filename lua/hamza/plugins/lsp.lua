local lsp_status, lsp = pcall(require, "lsp-zero")
if not lsp_status then
    print("Could not import lsp-zero")
    return
end

local navic_status, navic = pcall(require, "nvim-navic")
if not navic_status then
    print("Could not import naivc")
    return
end


lsp.preset("recommended")

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    print("Could not import cmp")
    return
end

local cmp_select = { behaviour = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I"
    }
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", ".e", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", ",e", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    if client.server_capabilities.documentSymbolProvider then
        navic.setup()
        navic.attach(client, bufnr)
    end
end)

lsp.setup()
