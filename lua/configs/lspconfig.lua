local builtin = require "telescope.builtin"

local map = vim.keymap.set

require("nvchad.configs.lspconfig").defaults()

local on_attach_extended = function(client, bufnr)
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

local on_attach_omnisharp = function(client, bufnr)
  on_attach_extended(client, bufnr)

  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  vim.keymap.del("n", "gd", opts "Go to definition")
  vim.keymap.del("n", "gD", opts "Go to declaration")
  vim.keymap.del("n", "gr")
  vim.keymap.del("n", "gi")

  map("n", "gd", function()
    require("omnisharp_extended").lsp_definition()
  end, { noremap = true })
  map("n", "gD", function()
    require("omnisharp_extended").lsp_type_definition()
  end, { noremap = true })
  map("n", "gr", function()
    require("omnisharp_extended").lsp_references()
  end, { noremap = true })
  map("n", "gi", function()
    require("omnisharp_extended").lsp_implementation()
  end, { noremap = true })
end

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
  -- omnisharp = {
  --   settings = {
  --     FormattingOptions = {
  --       -- Enables support for reading code style, naming convention and analyzer
  --       -- settings from .editorconfig.
  --       EnableEditorConfigSupport = true,
  --       -- Specifies whether 'using' directives should be grouped and sorted during
  --       -- document formatting.
  --       OrganizeImports = nil,
  --     },
  --     MsBuild = {
  --       -- If true, MSBuild project system will only load projects for files that
  --       -- were opened in the editor. This setting is useful for big C# codebases
  --       -- and allows for faster initialization of code navigation features only
  --       -- for projects that are relevant to code that is being edited. With this
  --       -- setting enabled OmniSharp may load fewer projects and may thus display
  --       -- incomplete reference lists for symbols.
  --       LoadProjectsOnDemand = nil,
  --     },
  --     RoslynExtensionsOptions = {
  --       -- Enables support for roslyn analyzers, code fixes and rulesets.
  --       EnableAnalyzersSupport = nil,
  --       -- Enables support for showing unimported types and unimported extension
  --       -- methods in completion lists. When committed, the appropriate using
  --       -- directive will be added at the top of the current file. This option can
  --       -- have a negative impact on initial completion responsiveness,
  --       -- particularly for the first few completion sessions after opening a
  --       -- solution.
  --       EnableImportCompletion = true,
  --       -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  --       -- true
  --       AnalyzeOpenDocumentsOnly = nil,
  --       EnableDecompilationSupport = true,
  --     },
  --     Sdk = {
  --       -- Specifies whether to include preview versions of the .NET SDK when
  --       -- determining which version to use for project loading.
  --       IncludePrereleases = true,
  --     },
  --   },
  --   on_attach = on_attach_omnisharp,
  -- },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, vim.tbl_deep_extend("keep", opts, { on_attach = on_attach_extended }))
  vim.lsp.enable(name)
end

-- C/C++
-- lspconfig.clangd.setup {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.signatureHelpProvider = false
--     on_attach(client, bufnr)
--   end,
--   capabilities = capabilities,
-- }

vim.lsp.config("roslyn", {
  settings = {
    ["csharp|code_lens"] = {
      dotnet_enable_references_code_lens = true,
    },
    ["csharp|symbol_search"] = {
      dotnet_search_reference_assemblies = true,
    },
  },
  on_attach = function (client, bufnr)
    if client.supports_method "textDocument/semanticTokens" then
      client.server_capabilities.semanticTokensProvider = nil
    end
    on_attach_extended(client, bufnr)
  end,
})
