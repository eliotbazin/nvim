-- Lazy bootstrap
local install_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(install_path) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    install_path,
  })
  print('Installing lazy.nvim close and reopen Neovim...')
end
vim.opt.rtp:prepend(install_path)

-- Check whether lazy exists
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  vim.notify('Could not find lazy')
  return
end

lazy.setup(require('plugins'), {
  -- Use deafult config
})
