local M = {}

function M.setup()
    require("tokyonight").setup({
        transparent = true,
        styles = {
            sidebars = "transparent", -- style for sidebars, see below
            floats = "transparent", -- style for floating windows
        },
        on_highlights = function(highlights, colors)
            highlights.MsgArea = { bg = colors.none }

            highlights.Normal = {
                bg = colors.none,
            }
            highlights.NormalNC = {
                bg = colors.none,
            }
            highlights.NormalFloat = {
                bg = colors.none,
            }
            highlights.NormalSB = {
                bg = colors.none,
            }
        end
    })
    vim.cmd [[colorscheme tokyonight]]
end

return M
