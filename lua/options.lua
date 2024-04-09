local set = vim.opt

-- Set terminal GUI colors
set.termguicolors = true

-- Line numbers
set.relativenumber = false -- Show relative line numbers
set.number = true -- Shows absolute line number (when relativenumber=true, absolute number is shown on selected line)

-- Search options
set.ignorecase = true -- Ignore case when searching
set.smartcase = true -- If mixed case is used in search it assumes you want case-sensitive

-- Line wrapping
set.wrap = false -- Disable line wrapping

-- Scrolloff
set.scrolloff = 3 -- Keep 3 lines below and above cursor when scrolling
set.sidescrolloff = 6 -- Keep 6 characters on either side of the cursor

-- Cursor line
set.cursorline = true -- Highlights the current line

-- Split windows
set.splitright = true -- Split vertical window to the right
set.splitbelow = true -- Split horizontal window to the bottom

-- Indentation
set.tabstop = 2 -- Set to two spaces
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

-- Enable mouse support
set.mouse = 'a'

-- Hide current mode
set.showmode = false

-- Smart auto indenting when starting a new line
set.smartindent = true

-- Treat '-' as character
vim.cmd([[set iskeyword+=-]])

-- Backspace
set.backspace = 'indent,eol,start' -- Allow backspace on indent, end of line or insert mode start position

-- Clipboard
set.clipboard:append('unnamedplus') -- Use system clipboard as default register

-- Disable built-in intro message
set.shortmess:append('I')

vim.loader.enable() -- Speed up loading of modules

-- Spelling
set.spell = true
set.spelllang = { 'en', 'da' }
