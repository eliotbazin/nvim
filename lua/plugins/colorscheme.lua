-- Ensure `vim.opt.termguicolors = true`
return function()
  -- Primary colorscheme
  local colorscheme = 'darcula-solid'

  local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
  if not status_ok then
    vim.notify('Colorscheme ' .. colorscheme .. ' not found!')
    return
  end
end
