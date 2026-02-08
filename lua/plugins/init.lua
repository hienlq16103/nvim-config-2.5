return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
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
    submodules = false,
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {},
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
    "kkoomen/vim-doge",
    event = "User FilePost",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      integrations = {
        telescope = true,
      },
    },
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
    "pteroctopus/faster.nvim",
    event = "BufReadPre",
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
      { "<leader>ut", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    "NvChad/base46",
    branch = "v3.0",
  },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      filewatching = "roslyn",
    },
    dependencies = {
      "neovim/nvim-lspconfig",
      "khoido2003/roslyn-filewatch.nvim",
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },
  { import = "nvchad.blink.lazyspec" },
  {
    "saghen/blink.cmp",
    opts = {
      cmdline = { enabled = false },
    },
  },
  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
  {
    "tronikelis/conflict-marker.nvim",
    opts = {
      highlights = true,
      on_attach = function(conflict)
        local MID = "^=======$"

        vim.keymap.set("n", "[x", function()
          vim.cmd("?" .. MID)
        end, { buffer = conflict.bufnr })

        vim.keymap.set("n", "]x", function()
          vim.cmd("/" .. MID)
        end, { buffer = conflict.bufnr })
      end,
    }
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(_, opts)
      require("luasnip").config.set_config(opts)
      require "nvchad.configs.luasnip"
      require("luasnip").filetype_extend("cs", { "unity" })
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = { blink = { enabled = true } },
    },
    ft = {"markdown"}
  }
  {
    "khoido2003/roslyn-filewatch.nvim",
    config = function()
      require("roslyn_filewatch").setup({})
    end,
  },
}
