return function()
  -- Setup copilot --
  require('copilot').setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
    -- filetypes = {}, -- Filestypes to disable copilot on
  })
  vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { link = 'CmpItemKindText' }) -- Make copilot symbol the same color as other symbol
end
