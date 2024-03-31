return function()
  require('Comment').setup({
    mappings = {
      basic = true,
      extra = true,
    },
    ignore = '^$',
  })
end
