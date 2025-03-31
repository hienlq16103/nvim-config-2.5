local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local builtin = require('telescope.builtin')

local map = vim.keymap.set

local on_attach_extended = function(client, bufnr)
  on_attach(client, bufnr)

  map("n", "<leader>lf", function()
    vim.diagnostic.open_float { border = "rounded" }
  end)

  map("n", "<leader>pr", builtin.lsp_references)
  map("n", "<leader>pi", builtin.lsp_implementations)
  map("n", "<leader>pd", builtin.diagnostics)
end

local on_attach_omnisharp = function (client, bufnr)
  on_attach_extended(client, bufnr)

  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  vim.keymap.del("n", "gd", opts("Go to definition"))
  vim.keymap.del("n", "gD", opts("Go to declaration"))
  vim.keymap.del("n", "gr", opts("Show references"))
  vim.keymap.del("n", "gi", opts("Go to implementation"))

  map("n", "gd", function() require("omnisharp_extended").lsp_definition() end, { noremap = true })
  map("n", "gD", function() require("omnisharp_extended").lsp_type_definition() end, { noremap = true} )
  map("n", "gr", function() require("omnisharp_extended").lsp_references() end, { noremap = true })
  map("n", "gi", function() require("omnisharp_extended").lsp_implementation() end, { noremap = true })
end

local servers = {
  "lua_ls",
  "hls",
  -- "denols",
  "intelephense",
  "sqlls",
  "cssls",
  "texlab",
  "taplo",
  "markdown_oxide",
  "jdtls",
  "cmake",
  "vimls",
  "clangd",
  "eslint",
  "ts_ls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach_extended,
    capabilities = capabilities,
  }
end

-- C/C++
-- lspconfig.clangd.setup {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.signatureHelpProvider = false
--     on_attach(client, bufnr)
--   end,
--   capabilities = capabilities,
-- }

-- C#
lspconfig.omnisharp.setup {
  cmd = { "dotnet", "C:\\Users\\hienl\\AppData\\Local\\nvim-data\\mason\\packages\\omnisharp\\libexec\\OmniSharp.dll" },
  settings = {
    FormattingOptions = {
      -- Enables support for reading code style, naming convention and analyzer
      -- settings from .editorconfig.
      EnableEditorConfigSupport = true,
      -- Specifies whether 'using' directives should be grouped and sorted during
      -- document formatting.
      OrganizeImports = nil,
    },
    MsBuild = {
      -- If true, MSBuild project system will only load projects for files that
      -- were opened in the editor. This setting is useful for big C# codebases
      -- and allows for faster initialization of code navigation features only
      -- for projects that are relevant to code that is being edited. With this
      -- setting enabled OmniSharp may load fewer projects and may thus display
      -- incomplete reference lists for symbols.
      LoadProjectsOnDemand = nil,
    },
    RoslynExtensionsOptions = {
      -- Enables support for roslyn analyzers, code fixes and rulesets.
      EnableAnalyzersSupport = nil,
      -- Enables support for showing unimported types and unimported extension
      -- methods in completion lists. When committed, the appropriate using
      -- directive will be added at the top of the current file. This option can
      -- have a negative impact on initial completion responsiveness,
      -- particularly for the first few completion sessions after opening a
      -- solution.
      EnableImportCompletion = true,
      -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
      -- true
      AnalyzeOpenDocumentsOnly = nil,
      EnableDecompilationSupport = true,
    },
    Sdk = {
      -- Specifies whether to include preview versions of the .NET SDK when
      -- determining which version to use for project loading.
      IncludePrereleases = true,
    },
  },
  on_init = on_init,
  on_attach = on_attach_omnisharp,
  capabilities = capabilities,
}

-- python
lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "E302", "E305", "E265", "E231", "E128", "E501" },
        },
      },
    },
  },
  on_init = on_init,
  on_attach = on_attach_extended,
  capabilities = capabilities,
}
