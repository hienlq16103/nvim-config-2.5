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
      vim.keymap.set("n", "<leader>lf", function()
        vim.diagnostic.open_float { border = "rounded" }
      end)
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
    cmd = { "Neogit" },
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local map = vim.keymap.set
      map("n", "<leader>db", dap.toggle_breakpoint)
      map("n", "<leader>dc", dap.continuek)
    end,
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
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = false,
          ["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
        },
        hover = {
          enabled = true,
          silent = true, -- set to true to not show a message if hover is not available
        },
        signature = {
          enabled = false,
          auto_open = {
            enabled = false,
            trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = false, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50, -- Debounce lsp signature help request by 50ms
          },
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true,
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup {
        background_colour = "#000000",
      }
    end,
  },
}
