local M = {}

function M.setup()
   local onedark = require('onedark')

   onedark.setup({
       style = "deep",
       transparent = true,
       code_style = {
           comments = "italic",
           keywords = "bold",
           functions = "italic,bold",
           strings = "none",
           variables = "none"
       }
   })
   onedark.load()
end

return M
