local M = {}

function M.setup()
   require("nvim-treesitter.configs").setup {
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
            disable = {"yaml"},
        }
   }
end


return M
