return function()
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
    dashboard.button('f', '󰈞 Find file', '<cmd>Telescope find_files<cr>'),
    dashboard.button('e', '󰝒 New file', '<cmd>ene <bar> startinsert <cr>'),
    dashboard.button('p', ' Find project', '<cmd>Telescope projects<cr>'),
    dashboard.button('r', '󱋡 Recently used files', '<cmd>Telescope oldfiles<cr>'),
    dashboard.button('c', ' Configuration', ':e $LOCALAPPDATA/nvim/init.lua<CR>'), -- Windows only
    dashboard.button('q', '󰅙 Quit Neovim', ':qa<CR>'),
    { type = 'padding', val = 1 },
  }

  local function footer()
    local datetime = os.date(' %d-%m-%Y')
    local total_plugins = #require('lazy').plugins() + 1
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

  require('alpha').setup(dashboard.opts)
end
