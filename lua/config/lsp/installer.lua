local M = {}

function M.setup(servers, opts)
    local lspconfig = require 'lspconfig'
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    require("mason").setup()
    require("mason-lspconfig").setup()
    for server_name, _ in pairs(servers) do
        if server_name == "sumneko_lua" then
            lspconfig['sumneko_lua'].setup({
                on_attach = opts.on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace"
                        },
                        workspace = {
                            ignoreDir = true,
                        }
                    }
                }
            })
            goto continue
        end
        lspconfig[server_name].setup { on_attach = opts.on_attach, capabilities = capabilities }
        ::continue::
    end
end

return M
