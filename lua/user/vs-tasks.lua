local M = {
  -- "EthanJWright/vs-tasks.nvim",
  "bart-b8/vs-tasks.nvim",
  -- dir = "/home/badcoute/repo/vs-tasks.nvim",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/which-key.nvim",
    {
      'Joakker/lua-json5',
      build = './install.sh'
    }
  },
  event = "VeryLazy",
}

-- Keymaps defined in keymaps.lua

function M.config() 
  require('vstask').setup({
    telescope_keys = {
      horizontal = '<CR>'
    }
  })
end

return M
