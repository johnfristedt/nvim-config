return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

    -- Theme
    use 'tomasiser/vim-code-dark'
    use 'ellisonleao/gruvbox.nvim'
    use 'rebelot/kanagawa.nvim'

    -- Completion framework:
    use 'hrsh7th/nvim-cmp'

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Chadtree
    use {
        'ms-jpq/chadtree',
        branch = 'chad',
        run = 'python3 -m chadtree deps'
    }

    -- Copilot
    use 'github/copilot.vim'

    -- DAP Client
    use 'mfussenegger/nvim-dap'
    use 'nvim-neotest/nvim-nio'
    use {
        'rcarriga/nvim-dap-ui',
        requires = {'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio'}
    }
    use 'theHamsta/nvim-dap-virtual-text'
end)
