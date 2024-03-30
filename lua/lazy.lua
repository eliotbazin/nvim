local fn = vim.fn

-- Lazy bootstrap
local install_path = fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(install_path) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '1',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    install_path,
  })
  print('Installing lazy.nvim close and reopen Neovim...')
end
vim.opt.rtp:prepend(install_path)

-- Check whether lazy exists
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  vim.notify('Could not find lazy')
  return
end

-- Autocommand that syncs lazy whenever the plugins.lua file is saved
-- vim.api.nvim_command('autocmd BufWritePost plugins.lua source % | PackerSync')
lazy.setup('plugins', {})

--[[ Load plugins --
return require('packer').startup(function(use)
  -- Dependencies --
  use('wbthomason/packer.nvim') -- Let packer manage itself
  use('nvim-lua/popup.nvim') -- An implementation of the Popup API from vim in Neovim
  use('nvim-lua/plenary.nvim') -- Useful lua functions used by lots of plugins
  use('kyazdani42/nvim-web-devicons') -- Adds file type icons to Vim plugins

  -- LSP --
  use('neovim/nvim-lspconfig') -- Enable LSP
  use('williamboman/mason.nvim') -- Simple to use language server installer
  use('williamboman/mason-lspconfig.nvim') -- Simple to use language server installer
  use('jose-elias-alvarez/null-ls.nvim') -- LSP diagnostics and code actions

  -- Autocompletion --
  use('hrsh7th/nvim-cmp') -- The completion plugin
  use('hrsh7th/cmp-buffer') -- Buffer completions
  use('hrsh7th/cmp-path') -- Path completions
  use('hrsh7th/cmp-cmdline') -- cmd-line completions
  use('hrsh7th/cmp-nvim-lsp') -- LSP completions
  use('hrsh7th/cmp-nvim-lua') -- nvim lua completions
  use('zbirenbaum/copilot.lua') -- Copilot
  use('zbirenbaum/copilot-cmp') -- Copilot cmp intergration
  use('windwp/nvim-autopairs') -- Autopairs
  use('L3MON4D3/LuaSnip') -- Snippet engine
  use('saadparwaiz1/cmp_luasnip') -- Luasnip cmp intergration
  use('micangl/cmp-vimtex') -- Vimtex cmp intergration

  -- Treesitter --
  use({ 'nvim-treesitter/nvim-treesitter', run = '<cmd>TSUpdate' })

  -- Telescope --
  use('nvim-telescope/telescope.nvim')
  use('nvim-telescope/telescope-ui-select.nvim') -- Uses telescope for more selections

  -- nvim-tree --
  use('nvim-tree/nvim-tree.lua')
  use('ahmedkhalf/project.nvim') -- Project management

  -- Lualine --
  use('nvim-lualine/lualine.nvim') -- Statusline in bottom of window
  use('AndreM222/copilot-lualine') -- Copilot status symbol in statusline

  -- Terminal --
  use('akinsho/toggleterm.nvim')

  -- Greeter --
  use('goolord/alpha-nvim')

  -- Colorschemes --
  use('rktjmp/lush.nvim') -- Colorscheme manager
  use('santos-gabriel-dario/darcula-solid.nvim')

  -- Git --
  use('lewis6991/gitsigns.nvim')

  -- VimTex
  use('lervag/vimtex') -- Integrates LaTeX into Neovim

  -- Utils --
  use('numToStr/comment.nvim') -- Allows for easy commenting
  use('moll/vim-bbye') -- Better buffer closing
  use('lukas-reineke/indent-blankline.nvim') -- Show indent lines

  -- Automatically set up configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)]] --
