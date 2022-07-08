local opt = vim.opt

vim.cmd[[
:set termguicolors
:set mouse=a
:set tabstop=4
:set shiftwidth=4
:set expandtab 
:set relativenumber
:set number
]]

require ("plugins")
require("autocmds")
require ("keys").set_keys()
require('config.transparent').setup()
require('colorizer').setup()
require('config.onedark').setup()
require("config.treesitter").setup()
require("config.nvim_tree").setup()
require("config.comment").setup()
require("config.lualine").setup()

