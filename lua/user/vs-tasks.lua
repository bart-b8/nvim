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

-- local callok, wk = pcall(require, 'which-key')
-- if not callok then
--   return M
-- end
--
-- M.config = function ()
--   wk.register({
--       t = {
--         name = "vs-tasks",
--         a = { function() require("telescope").extensions.vstask.tasks() end, "Tasks All"},
--         i = { function() require("telescope").extensions.vstask.inputs() end, "Open Input list"},
--         h = { function() require("telescope").extensions.vstask.history() end, "History"},
--         l = { function() require("telescope").extensions.vstask.launch() end, "Launch"},
--         c = { function() require("telescope").extensions.vstask.close() end, "close if toggle term"},
--       }
--     }, { prefix = "<leader>" })
-- end

return M
