return function()
  require('nvim-treesitter.configs').setup({
    ensure_installed = 'all',
    sync_install = false,
    ignore_install = { 'ocaml', 'ocaml_interface' }, -- List of parsers to ignore installing
    autopairs = {
      enable = true,
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      -- disable = { "latex" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { 'yaml' } },
  })
end
