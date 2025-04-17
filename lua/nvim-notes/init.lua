local M = {}

function M.setup(opts)
  require('nvim-notes.config').setup(opts)
  require('nvim-notes.commands').setup()
end

return M
