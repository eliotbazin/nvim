return function()
  require('ibl').setup({
    indent = {
      char = '▏',
      smart_indent_cap = true,
    },
    whitespace = {
      remove_blankline_trail = false,
    },
    scope = {
      -- Change to indentlevel hightligt once indent_blankline.nvim has been updated.
      enabled = true,
      show_start = false,
      show_end = false,
    },
    exclude = {
      filetypes = {
        'help',
        'terminal',
        'starter',
        'nvim-tree',
        'packer',
        'lspinfo',
        'TelescopePrompt',
        'TelescopeResults',
        'mason',
        '',
      },
      buftypes = {
        'terminal',
        'noFile',
      },
    },
  })
end
