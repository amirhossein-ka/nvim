local M = {}

function M.setup()
    require("telescope").setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-h>"] = "which_key"
                }
            }
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case",
            }
        }
    })


    require('telescope').load_extension('fzf')
end

return M
