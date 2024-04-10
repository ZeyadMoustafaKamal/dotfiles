local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
     ensure_installed = {
        "pyright",
        "prettierd"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    opts = {
      -- make sure mason installs the server
      servers = {
        -- html
        html = {
          filetypes = { "html", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        },
        -- Emmet
        emmet_ls = {
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
              },
            },
          },
        },
        -- CSS
        cssls = {},
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function ()
     return require("custom.configs.nvimtree")
    end
  },
  {
  "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require "null-ls"
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>lz"] = { name = "+Color" },
      },
    },
  },
  {
    "uga-rosa/ccc.nvim",
    opts = {},
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
    keys = {
      { "<leader>zp", "<cmd>CccPick<cr>", desc = "Pick" },
      { "<leader>zc", "<cmd>CccConvert<cr>", desc = "Convert" },
      { "<leader>zh", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Highlighter" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "html", "css" })
    end,
  },
  {
    'barrett-ruth/live-server.nvim',
    build = 'yarn global add live-server',
    config = true
  },
  {
    "kalekundert/vim-coiled-snake"
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false
  },
  {
    "ThePrimeagen/vim-be-good",
    lazy = false
  },
  {
    "czheo/mojo.vim",
    lazy = false
  }

}

return plugins
