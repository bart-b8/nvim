local M = {
  -- "EthanJWright/vs-tasks.nvim",
  dir = "/home/badcoute/repo/vs-tasks.nvim",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/which-key.nvim"
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
