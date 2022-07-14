local M = {}


function M.setup()
    require("bufferline").setup({
        options = {
            offsets = { { filetype = "NvimTree", text = "File Explorer" } },
            groups = {
                items = {
                    require("bufferline.groups").builtin.pinned:with({ icon = "車" })
                }
            },
            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = true,
            diagnostics_indicator = function(count, level)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
            color_icons = true,

            indicator_icon = '▎',
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',

        },
    })
end

return M
