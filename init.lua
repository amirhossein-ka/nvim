local opt = vim.opt

opt.termguicolors = true
opt.mouse = 'a'
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.number = true
opt.relativenumber = true

require("plugins")
vim.notify = require("notify")
require("autocmds")
require("keys").set_keys()
require("config.which_key")
require('config.transparent').setup()
require('colorizer').setup()
require('config.onedark').setup()
require("config.treesitter").setup()
require("config.nvim_tree").setup()
require("config.comment").setup()
require("config.lualine").setup()
require("config.bufferline").setup()
