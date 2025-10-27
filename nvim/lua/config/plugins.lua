return {
  -- Core
  { "nvim-lua/plenary.nvim", lazy = true },

  -- UI
  { "nvim-tree/nvim-tree.lua", config = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-lualine/lualine.nvim", config = true },
  { "nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Syntax
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "cpp", "python", "rust", "lua", "json", "yaml", "toml" },
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
      }
    end
  },

-- LSP + autocompletion plugins
{
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
    require("config.lsp")  -- Your LSP configuration module
  end,
},
{
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",   -- Load on insert mode start for performance
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    require("config.cmp")   -- Your completion config module
  end,
},


  -- Git
  { 
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.git")
        end,
    },
  { "NeogitOrg/neogit", dependencies = "nvim-lua/plenary.nvim", config = true },

}

