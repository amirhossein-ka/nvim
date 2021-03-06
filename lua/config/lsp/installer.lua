local M = {}

function M.setup(servers, opts)
    require("nvim-lsp-installer").setup {}
    -- local lsp_servers = require("nvim-lsp-installer.servers")
    local lspconfig = require'lspconfig'
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    for server_name, _ in pairs(servers) do
        -- local avaliable, server = lsp_servers.get_server(server_name)
        --[[ if avaliable then 
        server:on_ready({
            local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})
            server:setup(opts)
        }) ]]
        if server_name == "sumneko_lua" then
            local dev = require('lua-dev').setup({
                lspconfig = {
                    on_attach = opts.on_attach,
                    capabilities = capabilities,
                }
            })
            lspconfig['sumneko_lua'].setup(dev)
            goto continue
        end
        lspconfig[server_name].setup{ on_attach = opts.on_attach, capabilities = capabilities }
        ::continue::
    end
end


return M
