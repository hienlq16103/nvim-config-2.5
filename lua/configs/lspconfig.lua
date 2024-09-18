local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local pid = vim.fn.pid

local servers = {
  "lua_ls",
  "hls",
  "denols",
  "intelephense",
  "sqlls",
  "omnisharp",
  "cssls",
  "texlab",
  "taplo",
  "markdown_oxide",
  "jdtls",
  "cmake",
  "vimls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- C++
lspconfig.clangd.setup{
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  on_init = on_init,
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- C#
lspconfig.omnisharp.setup({
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
    ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
    ["textDocument/references"] = require('omnisharp_extended').references_handler,
    ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
  },
  cmd = {"omnisharp-mono", "--languageserver", "--hostPID", tostring(pid)},
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities
})

-- python
lspconfig.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'E302', 'E305', 'E265', 'E231', 'E128', 'E501'},
        }
      }
    }
  },
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities
}
