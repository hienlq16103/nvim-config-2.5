return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
      vim.keymap.set("n","<leader>lf", function ()
        vim.diagnostic.open_float{ border = "rounded" }
      end)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "clangd",
        "clang-format",
        "python-lsp-server",
        "haskell-language-server",
        "deno",
        "intelephense",
        "sqlls",
        "omnisharp",
        "omnisharp-mono",
        "css-lsp",
        "texlab",
        "taplo",
        "markdown-oxide",
        "codelldb",
        "jdtls",
  		},
  	},
  },
  {
  	"nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "asm",
        "bash",
        "c",
        "c_sharp",
        "cmake",
        "comment",
        "cpp",
        "css",
        "csv",
        "cuda",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "haskell",
        "haskell_persistent",
        "hjson",
        "html",
        "java",
        "javascript",
        "json",
        "json5",
        "jsdoc",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "php",
        "php_only",
        "phpdoc",
        "python",
        "query",
        "regex",
        "scss",
        "sql",
        "sql",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
  		},
  	},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function ()
      require('configs.indent-blankline')
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function ()
      require('nvim-ts-autotag').setup()
    end,
    ft = function ()
      return require('configs.nvim-ts-autotag-filetype')
    end
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
  {
    "cohama/lexima.vim",
    lazy = false,
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    event = "User FilePost",
  },
}
