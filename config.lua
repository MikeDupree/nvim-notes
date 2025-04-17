local M = {
  notes_dir = vim.fn.expand '~/.nvim-notes',
}

function M.setup(opts)
  M.notes_dir = vim.fn.expand(opts.notes_dir or M.notes_dir)
  vim.fn.mkdir(M.notes_dir, 'p') -- create if it doesn't exist
end

function M.get_notes_dir()
  return M.notes_dir
end

return M
