-- automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return require('packer').startup({
    function(use)
        -- package manager packer
        use('wbthomason/packer.nvim') -- have packer manage itself

        -- used by many plugins
        use('nvim-lua/plenary.nvim')
        
        -- an implementation of the Popup API from vim in Neovim
        use('nvim-lua/popup.nvim')
        
        -- git
        use({
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
            config = function()
                require('everlook.plugins.gitsigns')
            end,
        })

        -- theme, icons, statusbar, bufferbar
        use({
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup()
            end,
        })
        use('rcarriga/nvim-notify')

        -- color scheme
        use({
            'navarasu/onedark.nvim',
            config = function()
                require('onedark').setup({
                    style = 'darker'
                })
                require('onedark').load()
            end,
        })

        -- status line and buffer line
        use({
            'nvim-lualine/lualine.nvim',
            after = 'onedark.nvim',
            event = 'BufEnter',
            config = function()
                require('everlook.plugins.lualine')
            end,
        })

        use({
            'akinsho/bufferline.nvim', 
            tag = "v2.*",
            config = function()
                require('everlook.plugins.bufferline')
            end,
        })

        -- navigation
        use({
            'kyazdani42/nvim-tree.lua',
            event = 'CursorHold',
            config = function()
                require('everlook.plugins.nvim-tree')
            end,
        })

        -- editing
        use({
            'numToStr/Comment.nvim',
            event = 'BufRead',
            config = function()
                require('Comment').setup()
            end,
        })

        use({
	        'windwp/nvim-autopairs',
            config = function() 
                require("nvim-autopairs").setup()
            end,
        })

        -- treesitter
        use({
            'nvim-treesitter/nvim-treesitter',
            event = 'CursorHold',
            run = ':TSUpdate',
            config = function()
                require('everlook.plugins.treesitter')
            end,
        })

        -- telescope
        use({
            'nvim-telescope/telescope.nvim',
            tag = '0.1.0',
            config = function()
                require('everlook.plugins.telescope')
            end,
        })

        -- LSP, Completions and Snippets
        use({
            'neovim/nvim-lspconfig',
            -- event = 'BufRead',
            config = function()
                require('everlook.plugins.lsp')
            end,
        })
        
        use({
            'hrsh7th/nvim-cmp',
            config = function()
                require('everlook.plugins.lsp.cmp')
            end,
        })
        use({'hrsh7th/cmp-nvim-lsp'})
        use({'hrsh7th/cmp-buffer'})
        use({'hrsh7th/cmp-path'})
        use({'L3MON4D3/LuaSnip'})
        use({'williamboman/nvim-lsp-installer'})

        -- language support
    
        if packer_bootstrap then
            require('packer').sync()
        end
    end
})
