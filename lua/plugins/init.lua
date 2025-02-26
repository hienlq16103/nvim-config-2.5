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
    ft = "cs",
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
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      { "<F5>", "<cmd>lua require('dap').continue()<CR>" },
      { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>" },
      { "<leader>dt", "<cmd>lua require('dapui').toggle({ reset = true })<CR>" },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap-configs"
    end,
  },
  {
    "aznhe21/actions-preview.nvim",
    event = "LspAttach",
    config = function()
      vim.keymap.set({ "v", "n" }, "pa", require("actions-preview").code_actions)
    end,
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
  {
    "pteroctopus/faster.nvim",
    event = "BufReadPre",
  },
}
