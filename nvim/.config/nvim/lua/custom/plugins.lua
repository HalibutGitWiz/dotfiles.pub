local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Plugins installation
return packer.startup(function(use)

  -- Plugin manager + base plugins required by many others
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

  -- Color scheme
  use "sainnhe/sonokai"

  -- Completion plugins
  use "hrsh7th/nvim-cmp" -- Main plugin
  use "hrsh7th/cmp-buffer" -- Buffers completions
  use "hrsh7th/cmp-path" -- Path completions
  use "hrsh7th/cmp-cmdline" -- Commands completions
  use "saadparwaiz1/cmp_luasnip" -- Snippets completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions
  use "hrsh7th/cmp-nvim-lua" -- Neovim config completions
  use "nvim-tree/nvim-web-devicons" -- Display UTF-8 icons

  -- Code snippets
  use "L3MON4D3/LuaSnip" -- Snippet engine
  use "rafamadriz/friendly-snippets" -- Snippets for a large selection of languages

  -- Status bar
  use 'nvim-lualine/lualine.nvim'

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions
  use 'b0o/schemastore.nvim' -- Easy access to common files schema for JSON LSP
  use 'gbprod/phpactor.nvim' -- Brings PhpActor advanced features that are outside the LSP scope (eg. moving classes) as Neovim commands 

  -- Telescope (fuzzy finder)
  use "nvim-telescope/telescope.nvim"

  -- Nvimtree (file explorer)
  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  }

  -- Treesitter (better syntax highlighting)
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow" -- rainbow brackets

  -- Comments and documentation
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- Treesitter integration
  use { -- Docblock generator for PHP, JS and Lua (among others..)
    'kkoomen/vim-doge',
    run = ':call doge#install()'
  }

  -- Xdebug (and other DBGP debuggers) integration
  use 'vim-vdebug/vdebug'

  -- Project management
  use "ahmedkhalf/project.nvim" -- Autodetect projects and navigate with Telescope
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

  -- Other plugins
  use "windwp/nvim-autopairs" -- Automatically closes brackets, quotes, braces...
  use "lewis6991/gitsigns.nvim" -- Highlight changes lines
  use "numToStr/Navigator.nvim" -- Easy navigation between Tmux panes and Neovim windows
  use 'romgrk/barbar.nvim' -- Buffer bar
  use 'RRethy/vim-illuminate' -- Highlight other uses of current symbol on hover

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
