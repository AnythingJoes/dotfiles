return require('packer').startup(function()
    -- colorscheme
    use "EdenEast/nightfox.nvim"

    -- vim stuff
    use "tpope/vim-surround"
    use "tpope/vim-commentary"
 
    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    
    -- language stuff
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "neovim/nvim-lspconfig"
    
    -- rust stuff
    use "rust-lang/rust.vim"

    -- spelling stuff
    use { "neoclide/coc.nvim", branch = "release" }
end)
