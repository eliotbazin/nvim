local function keymap(mode, lhs, rhs, opts)
  return vim.api.nvim_set_keymap(
    mode,
    lhs,
    rhs,
    vim.tbl_extend('keep', opts or {}, {
      nowait = true,
      silent = true,
      noremap = true,
    })
  )
end

-- Remap leader key --
keymap('', '<Space>', '<Nop>', { desc = 'Leader key' })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Normal --
-- Window navigation
keymap('n', '<C-h>', '<C-w>h', { desc = 'Go to window to the left' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Go to window below' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Go to window above' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Go to window to the right' })

-- Window management
keymap('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
keymap('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
keymap('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Navigate buffers
keymap('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Go to next buffer' }) -- Go to next buffer
keymap('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Go to previous buffer' }) -- Go to previous buffer
keymap('n', '<leader>d', '<cmd>Bdelete<cr>', { desc = 'Delete current buffer' }) -- Delete buffer

-- Resize buffer with arrow keys
keymap('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Resize buffer vertical (+)' })
keymap('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Resize buffer vertical (-)' })
keymap('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Resize buffer horizontal (+)' })
keymap('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Resize buffer horizontal (-)' })

-- Clear search highlights
keymap('n', '<leader>nh', '<cmd>nohl<CR>', { desc = 'Clear search highlights' })

-- Increment/decrement numbers
keymap('n', '<leader>+', '<C-a>', { desc = 'Increment number' }) -- Increment
keymap('n', '<leader>-', '<C-x>', { desc = 'Decrement number' }) -- Decrement

-- Visual --
-- Move text up and down
keymap('v', 'J', "<cmd>move '>+1<CR>gv-gv", { desc = 'Move selection down' })
keymap('v', 'K', "<cmd>move '<-2<CR>gv-gv", { desc = 'Move selection up' })

keymap('v', '<M-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selected text down' })
keymap('v', '<M-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selected text up' })

keymap('v', 'p', '_dP', { desc = 'Keep copied text' })

-- LSP
keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.float<cr>', { desc = 'Show diagnostics' })
