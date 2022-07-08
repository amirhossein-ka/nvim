local M = {}

function M.setup()
    -- code
    local luadev = require("lua-dev").setup({})

    local lspconfig = require('lspconfig')
    lspconfig.sumneko_lua.setup(luadev)
end

return M
