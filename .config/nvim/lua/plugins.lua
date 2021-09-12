vim.cmd [[packadd packer.nvim]]
-- Auto compile when there are changes in plugins.lua
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

return require('packer').startup(function()
    ---- Customization ----
    ---- Their config is handled by the `config.themes` module
    -- Themes
    use {
        'joshdick/onedark.vim',
        branch = 'main'
    }
    use 'laggardkernel/vim-one'
    use 'overcache/NeoSolarized'
    -- Status bar
    use 'hoob3rt/lualine.nvim'

    ---- Enhancements ----
    -- Comment and uncomment easily
    use {
        'scrooloose/nerdcommenter',
        config = "require('config.nerdcommenter')",
    }
    -- Enhanced `%` for language-specific navigation
    use 'andymass/vim-matchup'
    -- Indentation guides
    use {
       'lukas-reineke/indent-blankline.nvim',
       config = "require('config.indent_blankline')"
    }

    ---- Git ----
    -- GUI wrapper
    use {
        'tpope/vim-fugitive',
        config = "require('config.fugitive')"
    }
    -- Decorations to the left
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = "require('config.gitsigns')"
    }

    ---- Navigation ----
    -- File explorer
    use {
        'scrooloose/nerdtree',
        config = "require('config.nerdtree')",
    }
    -- use {
    --     'kyazdani42/nvim-tree.lua',
    --     config = "require('config.nvim_tree')"
    -- }
    -- Fuzzy finder: requires `fd` and `rg`
    use {
      'nvim-telescope/telescope.nvim',
      config = "require('config.telescope')",
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    ---- LSP ----
    -- Configuration
    use 'neovim/nvim-lspconfig'
    -- Autocompletion
    use 'haorenW1025/completion-nvim'
    -- Extensions
    use 'nvim-lua/lsp_extensions.nvim'

    ---- Syntax ----
    -- Colorizer for CSS and similars
    use {
        'norcalli/nvim-colorizer.lua',
        config = "require('config.colorizer')",
    }
    -- TOML syntax highlighting
    use {
        'cespare/vim-toml',
        branch = 'main'
    }
    -- LaTeX editing: requires `pdflatex`
    use {
        'lervag/vimtex',
        config = "require('config.vimtex')",
        enabled = false,  -- Currently replaced by texlab
    }
    -- LaTeX math conceal
    use {
        'KeitaNakamura/tex-conceal.vim',
        config = "require('config.tex_conceal')"
    }
    -- Enhanced asciidoctor: requires `asciidoctor`
    use {
        'habamax/vim-asciidoctor',
        config = "require('config.asciidoctor')",
    }
    -- Live asciidoctor pdf preview: requires `asciidoctor-pdf`
    use {
        'marioortizmanero/adoc-pdf-live.nvim',
        config = "require('config.adoc_pdf_live')",
    }
    -- Live markdown preview:
    use {
        'iamcco/markdown-preview.nvim',
        run = ':call mkdp#util#install()'
    }

    -- Firefox extension for embedded neovim
    use {
        'glacambre/firenvim',
        run = ":call firenvim#install(0)",
        config = "require('config.firenvim')",
    }
end)
