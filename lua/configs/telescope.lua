local actions = require "telescope.actions"

local otps = {
  defaults = {
    wrap_results = true,
    path_display = {
      "filename_first"
    }
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
        }
      }
    }
  },
}

return otps
