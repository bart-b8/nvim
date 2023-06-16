local M = {
  'lervag/vimtex',
  lazy = false, -- true would break inverse-search mechanism (relies on global command :VimtexInverseSearch)
}

function M.config()
  -- vim.cmd("filetype plugin indent on") -- I'm guessing Lazy.nvim will do this by itself.

  vim.cmd("syntax enable")

  vim.g.vimtex_view_method = 'zathura'

  -- vim.g.vimtex_view_general_viewer = 'okular'
  -- vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'

  -- vim.g.vimtex_compiler_method = 'latexrun' 

  vim.g.maplocalleader = ' '

end

return M
