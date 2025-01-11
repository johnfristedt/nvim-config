return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- Ensures latest registry
    }
    use 'neovim/nvim-lspconfig' -- LSP configurations
    use 'hrsh7th/nvim-cmp' -- Autocomplete plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer' -- Buffer completions
    use 'hrsh7th/cmp-path' -- Path completions
    use 'saadparwaiz1/cmp_luasnip' -- Snippet completions
    use 'L3MON4D3/LuaSnip' -- Snippet engine
    use 'onsails/lspkind-nvim' -- Icons for completion
    use 'windwp/nvim-ts-autotag' -- Auto-close and rename HTML tags
    use 'nvim-treesitter/nvim-treesitter' -- Better syntax highlighting
end)
