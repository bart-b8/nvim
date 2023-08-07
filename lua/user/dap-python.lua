local M = {
  'mfussenegger/nvim-dap-python',
}

function M.config()
  require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
end

return M
