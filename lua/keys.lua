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
    map("n", "<Leader>w", "<cmd>w<CR>")
    map("n", "<Leader>f", "<cmd>lua vim.lsp.buf.format(nil, 2000)<CR>")
    -- bufferline keybindings
    map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>")
    map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>")

    -- others
    -- map('n', "<A-j>", "ddjP")
    -- map('n', '<A-k>', "ddkP")
    map("n", "<Leader>c", "<cmd>w<bar>redraw<bar>bp<bar>sp<bar>bn<bar>bd<CR>")


    map('n', 'ff', "<cmd>Telescope find_files<CR>")
    map('n', 'fg', "<cmd>Telescope live_grep<CR>")
    map("n", 'fb', '<cmd>Telescope buffers<CR>')
    map('n', "fh", "<cmd>Telescope help_tags<CR>")


end

return M
