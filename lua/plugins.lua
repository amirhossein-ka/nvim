local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end


return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"

    -- colorize hex number like this #000000
    use 'git@github.com:norcalli/nvim-colorizer.lua'

    use "git@github.com:navarasu/onedark.nvim"

    use {
        "git@github.com:folke/tokyonight.nvim"
    }

    -- transparent neovim
    use 'git@github.com:xiyaowong/nvim-transparent'

    use {
        'git@github.com:kyazdani42/nvim-tree.lua',
        requires = {
            'git@github.com:kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly', -- optional, updated every week. (see issue #1193)
        config = function()
            require("config.nvim_tree").setup()
        end
    }

    use {
        'git@github.com:numToStr/Comment.nvim',
        config = function()
            require("config.comment").setup()
        end
    }
    use {
        "git@github.com:windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup({}) end
    }

    use {
        "git@github.com:nvim-treesitter/nvim-treesitter",
        --        run = ':TSUpdate',
        -- config = function()
        -- require("config.treesitter").setup()
        -- end
    }

    use {
        'git@github.com:nvim-lualine/lualine.nvim',
        requires = { 'git@github.com:kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require("config.lualine").setup()
        end
    }

    use { "git@github.com:hrsh7th/cmp-nvim-lsp" }

    use {
        'git@github.com:hrsh7th/nvim-cmp',
        wants = "LuaSnip",
        requires = {
            { "git@github.com:hrsh7th/cmp-buffer", after = "nvim-cmp" },
            { "git@github.com:hrsh7th/cmp-path", after = "nvim-cmp" },
            { "git@github.com:hrsh7th/cmp-cmdline", after = "nvim-cmp" },
            { "git@github.com:saadparwaiz1/cmp_luasnip" },
            {
                "git@github.com:L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
            },
            "git@github.com:rafamadriz/friendly-snippets",
        },
        config = function()
            require("config.cmp")
        end,
    }

    use {
        "git@github.com:neovim/nvim-lspconfig",
        -- opt = true,
        wants = { "mason", "mason-lspconfig" },
        config = function()
            require("config.lsp").setup()
        end,
        requires = {
            "git@github.com:williamboman/mason-lspconfig.nvim.git",
            "git@github.com:williamboman/mason.nvim.git"
        },
    }

    use "git@github.com:rcarriga/nvim-notify"

    use {
        "git@github.com:folke/which-key.nvim",
        config = function()
            require("config.which_key")
        end
    }

    use {
        -- neovim lua autocompletion
        "git@github.com:folke/neodev.nvim",
        config = function()
            require("config.lua_dev").setup()
        end
    }

    use {
        'git@github.com:akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'git@github.com:kyazdani42/nvim-web-devicons',
        config = function()
            require("config.bufferline").setup()
        end
    }

    use {
        'git@github.com:jose-elias-alvarez/null-ls.nvim',
        config = function()
            require("config.null-ls").setup()
        end
    }

    use {
        -- terminal
        "git@github.com:akinsho/toggleterm.nvim",
        tag = 'v2.*',
        config = function()
            require("config.toggleterm").setup()
        end
    }

    use {
        -- do rest requests
        "git@github.com:NTBBloodbath/rest.nvim",
        requires = { "git@github.com:nvim-lua/plenary.nvim" },
        config = function()
            require("config.rest").setup()
        end
    }
    use {
        "git@github.com:lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                -- show_current_context = true,
                -- show_current_context_start = true,
            })
        end
    }

    use {
        -- discord status
        "git@github.com:andweeb/presence.nvim",
        config = function()
            require("presence"):setup({
                neovim_image_text = "GODLIKE EDITOR"
            })
        end
    }

    use {
        'git@github.com:nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            { 'git@github.com:nvim-lua/plenary.nvim' },
            { "git@github.com:nvim-telescope/telescope-fzf-native.nvim", run = 'make' }
        },
        config = function()
            require("config.telescope").setup()
        end
    }

    use {
        "git@github.com:mg979/vim-visual-multi.git"
    }

    use {
        'git@github.com:goolord/alpha-nvim',
        config = function()
            require("config.alpha")
        end
    }
    if Packer_bootstrap then
        require('packer').sync()
    end
end)
