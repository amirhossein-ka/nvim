local M = {}

function M.setup()
   require("nvim-treesitter.configs").setup {
        highlight = {
            enable = true,
        },
   }
end


return M
