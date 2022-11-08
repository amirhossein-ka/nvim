local M = {}

local servers = {
    gopls = {},
    -- golangci_lint_ls = {},
    sumneko_lua = {},
    bashls = {},
    pyright = {},
    dockerls = {},
}
local function on_attach(client, bufnr)
    -- Enable completion triggered by <C-X><C-O>
    -- See `:help omnifunc` and `:help ins-completion` for more information.
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Use LSP as the handler for formatexpr.
    -- See `:help formatexpr` for more information.
    vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

    -- Configure key mappings
    require("config.lsp.keymaps").setup(client, bufnr)


    -- change lsp float borders
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = 'rounded' }
    )
    
    -- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    --     vim.lsp.handlers.signature_help,
    --     { border = 'rounded' }
    -- )

end

local opts = {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
}

function M.setup()
    require("config.lsp.installer").setup(servers, opts)
end

return M
