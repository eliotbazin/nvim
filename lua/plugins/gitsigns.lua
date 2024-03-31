return function()
  require('gitsigns').setup({
    signs = {
      add = { hl = 'GitSignsAdd', text = '▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change = { hl = 'GitSignsChange', text = '▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      changedelete = { hl = 'GitSignsChange', text = '▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      delete = { hl = 'GitSignsDelete', text = '', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      topdelete = { hl = 'GitSignsDelete', text = '', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      follow_files = true,
    },
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },
    yadm = {
      enable = false,
    },
    on_attach = function(bufnr)
      local function keymap(mode, lhs, rhs, opts)
        return vim.api.nvim_buf_set_keymap(
          bufnr,
          mode,
          lhs,
          rhs,
          vim.tbl_extend('keep', opts or {}, {
            nowait = true,
            silent = true,
            noremap = true,
          })
        )
      end

      keymap('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>', { desc = 'Stage hunk.' })
      keymap('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>', { desc = 'Reset hunk.' })
      keymap(
        'v',
        '<leader>hs',
        '<cmd>lua require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })<cr>',
        { desc = 'Stage the selected lines.' }
      )
      keymap(
        'v',
        '<leader>hr',
        '<cmd>lua require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })<cr>',
        { desc = 'Reset the selected lines.' }
      )
      keymap('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<cr>', { desc = 'Undo staging of hunk.' })
      keymap('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<cr>', { desc = 'Preview hunk.' })
      keymap('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<cr>', { desc = 'Stage buffer.' })
      keymap('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<cr>', { desc = 'Reset buffer.' })
      keymap(
        'n',
        '<leader>hb',
        '<cmd>lua require("gitsigns").blame_line({ full = true })<cr>',
        { desc = 'Toggle blame.' }
      )
      keymap(
        'n',
        '<leader>tb',
        '<cmd>Gitsigns toggle_current_line_blame<cr>',
        { desc = 'Toggle blame for current line.' }
      )
      keymap('n', '<leader>hd', '<cmd>Gitsigns diffthis<cr>', { desc = 'Diff.' })
      keymap('n', '<leader>hD', '<cmd>lua require("gitsigns").diff_this("~")<cr>', { desc = 'Diff.' })
      keymap('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<cr>', { desc = 'Toggle deleted.' })

      keymap('x', 'ih', '<cmd>Gitsigns select_hunk<cr>', { desc = 'Select hunk.' })
    end,
  })
end
