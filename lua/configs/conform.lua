local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
  },
}

require("conform").setup(options)
