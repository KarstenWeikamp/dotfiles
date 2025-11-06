return {
    -- Core
    { "nvim-lua/plenary.nvim", lazy = true },

    -- UI
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "nvim-lualine/lualine.nvim", config = true },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files()
                end,
                desc = "Search for files (respecting .gitignore)",
            },
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Search for a string and get results live as you type, respects .gitignore",
            },
            {
                "<leader>fts",
                function()
                    require("telescope.builtin").treesitter()
                end,
                desc = "Lists function names, variables, and other symbols from treesitter queries"
            },
            {
                "<leader>fb",
                function()
                    require("telescope.builtin").buffers()
                end,
                desc = "List open buffers",
            },
            {
                "<leader>fh",
                function()
                    require("telescope.builtin").help_tags()
                end,
                desc = "Lists available help tags and opens a new window with the relevant help info"
            }
        },
    },
    { 
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
    },
    -- Syntax Highlighter
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
        end,
    },
    -- LSP + autocompletion plugins
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {'pyright', 'lua_ls', 'rust_analyzer'},
            })

        vim.lsp.config('clangd',{
            cmd = {
                "clangd",
                "--background-index",
                "--completion-style=detailed",
                "--clang-tidy",
                "--header-insertion=never",
                "-j=4",
                "--query-driver=/opt/ti/ti-cgt-armllvm_3.2.2.LTS/bin/tiarmclang,clang",
            },
            init_options = {
                usePlaceholders = true,
                completeUnimported = true,
                clangdFileStatus = true,
            },
        })
        vim.lsp.enable({'clangd' })
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
    -- Autoclose brackets etc...
    {
        "m4xshen/autoclose.nvim",
        event = "InsertEnter", -- Optional: lazy-load on entering insert mode
        config = function()
            require("autoclose").setup({
                options = {
                    disabled_filetypes = { "text", "markdown" },
                },
            })
        end,
    },
     -- Git
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = function()
            require("config.git")
        end,
        keys = {
            {
                "<leader>gsh",
                function()
                    require("gitsigns").stage_hunk()
                end,
               desc = "Stage Hunk",
            },
            {
                "<leader>gsf",
                function()
                    require("gitsigns").stage_buffer()
                end,
                desc = "Stage file",
            },
            {
                "<leader>grh",
                function()
                    require("gitsigns").reset_hunk()
                end,
                desc = "Reset Hunk",
            },
            {
                "<leader>grf",
                function ()
                    require("gitsigns").reset_buffer()
                end,
                desc = "Reset buffer",
            },
        }
    },
    {
        "NeogitOrg/neogit",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        lazy = false,
        keys = {
            {
                "<leader>gco",
                function()
                    require("neogit").open({kind = "split", "branch"})
                end,
                desc = "Checkout Branch",
            },
            {
                "<leader>gcc",
                function()
                    require("neogit").open({kind = "split", "commit"})
                end,
                desc = "Commit"
            },
            {
                "<leader>grb",
                function()
                    require("neogit").open({kind = "split", "rebase"})
                end,
                desc = "Rebase",
            },
        },
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup()
        end,
    },
    {
        "stevearc/overseer.nvim",
        cmd = { "OverseerInfo", "OverseerToggle", "OverseerRun", "OverseerRunTemplate" },
        config = function()
            require("overseer").setup({
                log = {
                    {
                        type = "file",
                        filename = "overseer.log",
                        level = vim.log.levels.DEBUG, -- or TRACE for max verbosity
                    },
                },
                strategy = {
                    "toggleterm",
                    direction = "horizontal",
                    size = 15,
                    use_shell = true,
                    close_on_exit = false,
                    open_on_start = true,
                    quit_on_exit = "success",
                    auto_scoll = true,
                }
            })
        end,
        keys = {
            {
                "<leader>mmh",
                function ()
                    require("toggleterm")
                    require("overseer.mmh")
                    require("overseer").run_template({name = "MakeMeHappyBuild"})
                end,
                desc = "Run MMH build",
            },
        },

    },
}

