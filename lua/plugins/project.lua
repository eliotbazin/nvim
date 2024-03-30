local cmp_status_ok, project = pcall(require, 'project_nvim')
if not cmp_status_ok then
  vim.notify('Could not find project.nvim')
  return
end

project.setup({
  patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'README.md', '=src' },
  -- show_hidden = true,
  silent_chdir = true,
})
