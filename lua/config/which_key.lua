local whichkey = require("which-key")


local keymap_b = {
    b = {
        name = "Buffer",
        i = { "<cmd>BufferLinePick<CR>", "Select buffer" },
        c = { "<cmd>BufferLinePickClose<CR>", "Close Buffer" },
        p = { "<cmd>BufferLineTogglePin<CR>", "Pin Buffer" },
    }
}

local keymap_leader = {
    e = { "<cmd>NvimTreeToggle<CR>", "Toggle nvim tree" },
    f = { "<cmd>lua vim.lsp.buf.formatting_sync(nil, 2000)<CR>", "Format file" },
    t = { "<cmd>ToggleTerm<CR>", "Toggle Terminal"},
}


whichkey.register(keymap_b, { prefix = "<Leader>" })
whichkey.register(keymap_leader, { prefix = "<Leader>" })
