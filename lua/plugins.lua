return require('packer').startup(function ()
    use "wbthomason/packer.nvim"

    use 'norcalli/nvim-colorizer.lua'

    use 'navarasu/onedark.nvim'
    use 'xiyaowong/nvim-transparent'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        'numToStr/Comment.nvim',
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate',
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'hrsh7th/nvim-cmp',
        wants = "LuaSnip",
        requires = {
            {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
            {"hrsh7th/cmp-path",   after = "nvim-cmp"},
            {"hrsh7th/cmp-cmdline",after = "nvim-cmp"},
            {"saadparwaiz1/cmp_luasnip"},
            {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                config = function()
                    require("config.luasnip").setup()
                end,
            },
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("config.cmp")
        end,
    }
    -- use {
    --     "L3MON4D3/LuaSnip",
    --     config = function()
    --         require("luasnip.loaders.from_lua").lazy_load()
    --         require("luasnip.loaders.from_vscode").lazy_load()
    --     end
    -- }    
    -- use { 'saadparwaiz1/cmp_luasnip' }
    --
    -- use "rafamadriz/friendly-snippets"
    --

    use {
        "neovim/nvim-lspconfig",
        opt = true,
        event = "BufReadPre",
        wants = { "nvim-lsp-installer", "lsp_signature.nvim" },
        config = function()
            require("config.lsp").setup()
        end,
        requires = {
            "williamboman/nvim-lsp-installer",
            "ray-x/lsp_signature.nvim",
        },
    }

    use "rcarriga/nvim-notify"

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        "folke/lua-dev.nvim",
        config = function()
            require("config.lua_dev").setup()
        end
    }
end)

