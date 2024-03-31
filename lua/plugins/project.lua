return function()
  require('project_nvim').setup({
    patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'README.md', '=src' },
    -- show_hidden = true,
    silent_chdir = true,
  })
end
