local M = {}


local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


function M.set_keys()
    vim.g.mapleader = " "
    map("n", "<Leader>e", ":NvimTreeToggle<CR>")
end


return M
