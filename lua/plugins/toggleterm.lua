return function()
  require('toggleterm').setup({
    size = 13,
    open_mapping = [[<C-t>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
    --[[ float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	}, ]]
  })

  function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-t><C-n>]], opts) -- NOT WORKING
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts) -- Allow upwards movement
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts) -- Allow downwards movement
    -- vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts) -- Allow sideways (left) movement
    -- vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts) -- Allow sideways (right) movement

    vim.api.nvim_command('autocmd BufEnter <buffer> startinsert!') -- Always go to insert mode when entering terminal
    vim.api.nvim_command('autocmd BufLeave <buffer> stopinsert!') -- Always go to normal mode when exiting terminal
  end

  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end
