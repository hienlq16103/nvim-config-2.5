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
    end,
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
    config = function()
      require "configs.indent-blankline"
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    ft = function()
      return require "configs.nvim-ts-autotag-filetype"
    end,
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
  {
    "kkoomen/vim-doge",
    event = "User FilePost",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function()
      require "configs.noiceOptions"
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    "Chaitanyabsprip/fastaction.nvim",
    ---@type FastActionConfig
    opts = {
      dismiss_keys = { "j", "k", "<c-c>", "q", "<Esc>" },
    },
    event = "LspAttach",
  },
}
