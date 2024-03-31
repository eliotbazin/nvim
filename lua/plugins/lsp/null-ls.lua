-- Find all supported sources here:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
--
-- A lot of these tool can be installed using Mason. Run `:Mason` to see all available tools.

return function()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

  null_ls.setup({
    debug = false,
    sources = {
      -- FORMATTING --
      formatting.prettier.with({
        extra_filetypes = { 'toml' },
        extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
      }),
      formatting.stylua.with({
        condition = function(utils)
          return utils.root_has_file('.stylua.toml') or utils.root_has_file('stylua.toml')
        end,
      }),
      formatting.latexindent,
    },
    on_attach = function(client, bufnr)
      if client.supports_method('textDocument/formatting') then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end,
  })
end
