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
        config = function() require("nvim-autopairs").setup({}) end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate',
        config = function()
            require("config.treesitter").setup()
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {"hrsh7th/cmp-nvim-lsp"}

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
            },
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("config.cmp")
        end,
    }

    use {
        "neovim/nvim-lspconfig",
        -- opt = true,
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

