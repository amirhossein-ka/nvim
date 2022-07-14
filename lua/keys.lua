local M = {}

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.set_keys()
    vim.g.mapleader = " "
    -- map("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>")
    map("n", "<Leader>w", "<cmd>w<CR>")
    map("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 2000)<CR>")
    -- bufferline keybindings
    -- map("n", "<Leader>bi", "<cmd>BufferLinePick<CR>")
    -- map("n", "<Leader>bc", "<cmd>BufferLinePickClose<CR>")
    map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>")
    map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>")
    -- map("n", "<Leader>bp", "<cmd>BufferLineTogglePin<CR>", { silent = true })

    -- others
    map('n', '<A-k>', "ddkP")
    map('n', "<A-j>", "ddjP")
    map("n", "<Leader>c", "<cmd>w<bar>bp<bar>sp<bar>bn<bar>bd<CR>")

end

return M
