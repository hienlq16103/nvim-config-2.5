local builtin = require "telescope.builtin"
local map = vim.keymap.set

require("nvchad.configs.lspconfig").defaults()

local on_attach_extended = function(_, bufnr)
  map("n", "<leader>lf", function()
    vim.diagnostic.open_float { border = "rounded" }
  end)

  map("n", "<leader>pr", builtin.lsp_references)
  map("n", "<leader>pi", builtin.lsp_implementations)
  map("n", "<leader>pd", builtin.diagnostics)

  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "<leader>sh", vim.lsp.buf.signature_help)
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
  map("n", "gr", vim.lsp.buf.references)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    on_attach_extended(_, args.buf)
  end,
})

local servers = {
  lua_ls = {},
  sqlls = {},
  markdown_oxide = {},
  clangd = {},
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = { "E302", "E305", "E265", "E231", "E128", "E501" },
          },
        },
      },
    },
  },
  taplo = {},
  html = {},
  ts_ls = {},
  cssls = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

vim.lsp.config("roslyn", {
  settings = {
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "defaults",
      dotnet_compiler_diagnostics_scope = "openFiles",
    },
    ["csharp|code_lens"] = {
      dotnet_enable_references_code_lens = true,
    },
    ["csharp|symbol_search"] = {
      dotnet_search_reference_assemblies = true,
    },
  },
  on_attach = function(client, bufnr)
    require("nvchad.configs.lspconfig").on_init(client, bufnr)
  end,
})
