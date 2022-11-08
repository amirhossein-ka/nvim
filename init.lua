vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt
opt.termguicolors = true
opt.mouse = 'a'
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.mousemoveevent = true


require("plugins")
require("notify").setup({
    background_colour = "#000000"
})

vim.notify = require("notify")
require("autocmds")
require("keys").set_keys()
require('config.transparent').setup()
require('colorizer').setup()
require("config.treesitter").setup()
require("config.onedark").setup()
-- require("config.tokyonight").setup()
