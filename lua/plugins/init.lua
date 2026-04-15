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
      { "<F5>", "<cmd>lua require('dap').continue()<CR>" },
      { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>" },
      { "<leader>dt", "<cmd>lua require('dap-view').toggle()<CR>" },
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
    "tronikelis/conflict-marker.nvim",
    lazy = true,
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
      markers = {
        start = "^<<<<<<<",
        ending = "^>>>>>>>",
        mid = "^=======$",
        base = "^|||||||",
      },
    },
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
    build = "npm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },
  {
    dir = "~\\source\\personal\\floating-cmd",
    opts = {},
    lazy = false,
    cond = false,
  },
  {
    "khoido2003/roslyn-filewatch.nvim",
    config = function()
      require("roslyn_filewatch").setup {}
    end,
  },
  {
    "andrewferrier/debugprint.nvim",
    opts = {
      filetypes = {
        ["cs"] = {
          left = 'Debug.Log($"',
          right = '");',
          mid_var = "{",
          right_var = '}");',
        },
      },
    },
    event = "User FilePost",
    version = "*", -- Remove if you DON'T want to use the stable version
  },
}
