local M = {}

-- Check if the cursor is in a math zone.
function M.in_math()
  return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

function M.not_in_math()
  return not M.in_math()
end

-- Check if the cursor is in a comment.
function M.in_comment()
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end

-- Check which environment the cursor is in.
local function env(name)
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

function M.in_preamble()
  return not env("document")
end

function M.in_text()
  return env("document") and not M.in_math()
end

function M.in_tikz()
  return env("tikzpicture")
end

function M.in_bullets()
  return env("itemize") or env("enumerate")
end

function M.in_align()
  return env("align") or env("align*") or env("aligned")
end

return M
