local api = vim.api

api.nvim_create_autocmd("InsertEnter", {
    command = "normal zz<CR>",
})
