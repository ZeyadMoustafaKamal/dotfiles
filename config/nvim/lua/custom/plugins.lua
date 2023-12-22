local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
     ensure_installed = {
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig" -- working
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        custom = {
          ".venv",
          ".git"
        }
      }
    }
  }
}

return plugins
