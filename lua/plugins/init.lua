local path = (...):match('(.-)[^%.]+$') .. 'plugins.'

return {
  -- DEPENDENCIES --
  'nvim-lua/plenary.nvim',
  'kyazdani42/nvim-web-devicons',

  -- LSP --
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- To set capabilities
    },
    config = require(path .. 'lsp.handlers').setup,
  },
  { -- Mason
    'williamboman/mason.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason-lspconfig.nvim',
    },
    config = require(path .. 'lsp.mason'),
  },
  { -- null-ls
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = require(path .. 'lsp.null-ls'),
  },

  --- CMP ---
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      { -- Copilot
        'zbirenbaum/copilot-cmp',
        dependencies = {
          { 'zbirenbaum/copilot.lua', config = require(path .. 'copilot') },
        },
      },
      { -- LuaSnip
        'saadparwaiz1/cmp_luasnip',
        dependencies = {
          'L3MON4D3/LuaSnip',
          config = require(path .. 'luasnip'),
        },
      },
      { -- Vimtex
        'micangl/cmp-vimtex',
        dependencies = { 'lervag/vimtex' },
      },
    },
    config = require(path .. 'cmp'),
  },

  -- UI ---
  { -- Colorscheme
    'santos-gabriel-dario/darcula-solid.nvim',
    dependencies = {
      'rktjmp/lush.nvim',
    },
    config = require(path .. 'colorscheme'),
    priority = 100, -- Load first
  },
  { -- Greeeter
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = require(path .. 'alpha'),
  },
  { -- treesitter
    'nvim-treesitter/nvim-treesitter',
    config = require(path .. 'treesitter'),
    --build = '<cmd>TSUpdate',
  },
  { -- Indentline
    'lukas-reineke/indent-blankline.nvim',
    config = require(path .. 'indentline'),
    version = 'v2.20.8',
  },
  { -- telescope
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim', -- Use telescope for more selections
      'kyazdani42/nvim-web-devicons',
    },
    config = require(path .. 'telescope'),
  },
  { -- nvim-tree
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = require(path .. 'nvim-tree'),
  },
  { -- lualine
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      'AndreM222/copilot-lualine',
    },
    config = require(path .. 'lualine'),
  },
  { -- Toggleterm
    'akinsho/toggleterm.nvim',
    config = require(path .. 'toggleterm'),
  },
  { -- Gitsigns
    'lewis6991/gitsigns.nvim',
    config = require(path .. 'gitsigns'),
  },
  --- VIMTEX ---
  {
    'lervag/vimtex',
    config = require(path .. 'vimtex'),
  },

  --- UTILS ---
  'moll/vim-bbye', -- Better buffer closing
  { -- autopairs
    'windwp/nvim-autopairs',
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    event = 'InsertEnter',
    config = require(path .. 'autopairs'),
  },
  { -- Comment
    'numToStr/comment.nvim',
    config = require(path .. 'comment'),
  },
  { -- Project
    'ahmedkhalf/project.nvim',
    config = require(path .. 'project'),
  },
}
