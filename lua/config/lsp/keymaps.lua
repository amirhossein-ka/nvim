local M = {}

local whichkey = require("which-key")

local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

local function keymappings(client, bufnr)
    local opts = { noremap = true, silent = true }

    -- Key mappings
    buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
    keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

    -- Whichkey
    local keymap_l = {
        l = {
            name = "Code",
            r = { vim.lsp.buf.rename, "Rename" },
            a = { vim.lsp.buf.code_action, "Code Action" },
            d = { vim.diagnostic.open_float(), "Line Diagnostics" },
            i = { "<cmd>LspInfo<cr>", "Lsp Info" },
        },
    }
    if client.server_capabilities.document_formatting then
        keymap_l.l.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
    end

    local keymap_g = {
        g = {
            name = "Goto",
            d = { vim.lsp.buf.definition, "Definition" },
            D = { vim.lsp.buf.declaration, "Declaration" },
            s = { vim.lsp.buf.signature_help, "Signature Help" },
            I = { vim.lsp.buf.implementation, "Goto Implementation" },
            t = { vim.lsp.buf.type_definition, "Goto Type Definition" },
        }
    }
    whichkey.register(keymap_l, { buffer = bufnr, prefix = "<leader>" })
    whichkey.register(keymap_g, { buffer = bufnr, prefix = "<leader>" })
end

function M.setup(client, bufnr)
    keymappings(client, bufnr)
end

return M
