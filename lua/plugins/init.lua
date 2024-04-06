local path = (...):match('(.-)[^%.]+$') .. 'plugins.'

return {
  -- DEPENDENCIES --
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'kyazdani42/nvim-web-devicons', lazy = true },

  -- LSP --
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- To set capabilities
      'williamboman/mason-lspconfig.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = require(path .. 'lsp.handlers').setup,
  },
  { -- Mason
    'williamboman/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate',
    config = require(path .. 'lsp.mason'),
  },
  { -- null-ls
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'williamboman/mason.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
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
    event = 'VeryLazy',
    config = require(path .. 'cmp'),
  },

  -- UI ---
  { -- Colorscheme
    'santos-gabriel-dario/darcula-solid.nvim',
    dependencies = {
      'rktjmp/lush.nvim',
    },
    config = require(path .. 'colorscheme'),
    -- Load first
    lazy = false,
    priority = 1000,
    event = 'VimEnter',
  },
  { -- Greeeter
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = require(path .. 'alpha'),
  },
  { -- treesitter
    'nvim-treesitter/nvim-treesitter',
    -- event = { 'BufWinEnter', 'BufNewFile' },
    event = 'VeryLazy',
    config = require(path .. 'treesitter'),
    --build = '<cmd>TSUpdate',
  },
  { -- Indentline
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    config = require(path .. 'indentline'),
  },
  { -- telescope
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim', -- Use telescope for more selections
      'kyazdani42/nvim-web-devicons',
      'ahmedkhalf/project.nvim',
    },
    cmd = 'Telescope',
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Find recent files' },
      { '<leader>fb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search buffer' },
    },
    config = require(path .. 'telescope'),
  },
  { -- nvim-tree
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    cmd = 'NvimTreeToggle',
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Explorer' },
    },
    config = require(path .. 'nvim-tree'),
  },
  { -- lualine
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      'AndreM222/copilot-lualine',
    },
    event = 'VeryLazy',
    key = {
      { '<c-u>', "<cmd>lua require'luasnip.extras.select_choice'()<cr>", desc = 'Open choice menu for snippets' },
    },
    config = require(path .. 'lualine'),
  },
  { -- Toggleterm
    'akinsho/toggleterm.nvim',
    keys = {
      { '<c-t>', '<cmd>ToggleTerm<cr>', desc = 'Toggle terminal' },
    },
    cmd = 'ToggleTerm',
    config = require(path .. 'toggleterm'),
  },
  { -- Gitsigns
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = require(path .. 'gitsigns'),
  },
  --- VIMTEX ---
  {
    'lervag/vimtex',
    ft = { 'tex', 'bib', 'cls' },
    config = require(path .. 'vimtex'),
  },

  --- UTILS ---
  { -- Better buffer closing
    'moll/vim-bbye',
    event = 'BufWinLeave',
  },
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
    event = 'BufReadPost',
    config = require(path .. 'comment'),
  },
  { -- Project
    'ahmedkhalf/project.nvim',
    event = 'VeryLazy',
    config = require(path .. 'project'),
  },
}
