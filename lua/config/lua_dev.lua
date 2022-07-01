local M = {}

function M.setup()
    -- code
    local luadev = require("luadev").setup({})

    local lspconfig = require('lspconfig')
    lspconfig.sumneko_lua.setup(luadev)
end
