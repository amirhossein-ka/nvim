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
    r = { "<Plug>RestNvim<CR>", "Run rest file"}
}

local keymap_f = {
    f = {
        f = {"<cmd>Telescope find_files<CR>", "Telescope find files"},
        g = {"<cmd>Telescope live_grep<CR>", "Telescope live grep"},
        b = {'<cmd>Telescope buffers<CR>', "Telescope Buffres"},
        h = {"<cmd>Telescope help_tags<CR>", "Telescope Help"}
    }
}


whichkey.register(keymap_b, { prefix = "<Leader>" })
whichkey.register(keymap_f)
whichkey.register(keymap_leader, { prefix = "<Leader>" })
