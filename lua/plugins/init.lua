return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
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
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      require "configs.indent-blankline"
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "User FilePost",
    submodules = false,
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
    event = "User FilePost",
  },
  {
    "kkoomen/vim-doge",
    init = function ()
      vim.g.doge_mapping = "<leader>dj"
    end,
    event = "User FilePost",
    build = ":call doge#install()",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      integrations = {
        telescope = true,
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "igorlfs/nvim-dap-view",
      "theHamsta/nvim-dap-virtual-text",
      "ownself/nvim-dap-unity",
    },
    config = function()
      require "configs.dap-configs"
    end,
    keys = {
      { "<F5>", function() require('dap').continue() end },
      { "<leader>db", function() require('dap').toggle_breakpoint() end },
      { "<leader>dt", function() require('dap-view').toggle() end },
    },
  },
  {
    "igorlfs/nvim-dap-view",
    lazy = true,
    version = "1.*",
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = {
      winbar = {
        sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
        controls = {
          enabled = true,
        }
      }
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {},
  },
  {
    "ownself/nvim-dap-unity",
    build = function()
      -- make sure adapter to be installed properly
      require("nvim-dap-unity").install()
    end,
    opts = {},
  },
  {
    "pteroctopus/faster.nvim",
    event = "BufReadPre",
  },
  {
    "jiaoshijie/undotree",
    opts = {},
    keys = {
      { "<leader>ut", function() require('undotree').toggle() end },
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
      completion = {
        accept = {
          auto_brackets = { enabled = false },
        },
        ghost_text = { enabled = true },
      },
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
    "L3MON4D3/LuaSnip",
    config = function(_, opts)
      require("luasnip").config.set_config(opts)
      require "nvchad.configs.luasnip"
      require("luasnip").filetype_extend("cs", { "unity" })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = { blink = { enabled = true } },
    },
    ft = { "markdown" },
  },
  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },
  {
    "andrewferrier/debugprint.nvim",
    opts = {
      filetypes = {
        ["cs"] = {
          left = 'UnityEngine.Debug.Log($"',
          right = '");',
          mid_var = "{",
          right_var = '}");',
        },
      },
    },
    event = "User FilePost",
    version = "*", -- Remove if you DON'T want to use the stable version
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
        virt_text_priority = 10000,
      },
      current_line_blame_formatter = '<author> [ <author_time:%I:%M %p - %d/%m/%Y> ] - <summary>',
    }
  },
}
