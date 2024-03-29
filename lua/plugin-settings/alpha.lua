local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = {
  '                                                     ',
  '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
  '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
  '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
  '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
  '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
  '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
  '                                                     ',
}
dashboard.section.buttons.val = {
  { type = 'text', val = 'Shortcuts', opts = { hl = 'SpecialComment', position = 'center' } },
  dashboard.button(
    'f',
    '󰈞 Find file',
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>"
  ),
  dashboard.button('e', '󰝒 New file', '<cmd>ene <bar> startinsert <cr>'),
  dashboard.button('p', '  Find project', '<cmd>lua require("telescope").extensions.projects.projects(require("telescope.themes").get_dropdown({ previewer = false }))<CR>'),
  dashboard.button(
    'r',
    '󱋡 Recently used files',
    "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
  ),
  dashboard.button('c', '  Configuration', ':e $XDG_CONFIG_HOME/nvim/init.lua<CR>'),
  dashboard.button('q', '󰅙 Quit Neovim', ':qa<CR>'),
  { type = 'padding', val = 1 },
}

local function footer()
  local datetime = os.date(' %d-%m-%Y')
  local total_plugins = vim.fn.len(vim.fn.globpath('~/AppData/Local/nvim-data/site/pack/packer/start', '*', 0, 1))
  local plugins_info = '󰂓 ' .. total_plugins .. ' plugins'
  local version = vim.version()
  local nvim_version_info = ' v' .. version.major .. '.' .. version.minor .. '.' .. version.patch

  return datetime .. '  ' .. plugins_info .. '  ' .. nvim_version_info
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = 'Type'
dashboard.section.header.opts.hl = 'Include'
dashboard.section.buttons.opts.hl = 'Keyword'

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
