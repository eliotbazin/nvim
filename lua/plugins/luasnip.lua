return function()
  require('luasnip').config.setup({
    enable_autosnippets = true,
    -- history = true,
    -- store_selection_keys = "<Tab>",
    update_events = 'TextChanged,TextChangedI',
  })

  -- vim.cmd([[
  --   snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
  --   snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

  -- vim.cmd.keymap({ "i", "s" }, "<Tab>", "<cmd>lua require('luasnip').jump(1)<Cr>", { nowait = true, noremap = true, silent = true })
  -- vim.cmd.keymap("i", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<Cr>", { nowait = true, noremap = true, silent = true })

  require('luasnip.loaders.from_lua').lazy_load({ paths = 'snippets/' }) -- Only load snippets when needed
end
