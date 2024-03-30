-- Responsible for setting up the language servers, as well as being a place to download tools used by null-ls --

-- Servers mason should have installed --
local servers = {
  'lua_ls',
  'texlab',
}

local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
  vim.notify('Could not find mason')
  return
end

local mason_lsp_status_ok, mason_lsp = pcall(require, 'mason')
if not mason_lsp_status_ok then
  vim.notify('Could not find mason-lspconfig')
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  vim.notify('Could not find lspconfig')
  return
end

mason.setup({
  PATH = 'prepend',
  ui = {
    border = 'none',
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
})

mason_lsp.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- Attach handlers and capabilities to the language servers
local opts = {}
for _, server in pairs(servers) do
  opts = {
    on_attach = require('plugins.lsp.handlers').on_attach,
    capabilities = require('plugins.lsp.handlers').capabilities,
  }

  server = vim.split(server, '@')[1]

  local require_ok, conf_opts = pcall(require, 'plugins.lsp.configs.' .. server)
  if require_ok then
    opts = vim.tbl_deep_extend('force', conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
