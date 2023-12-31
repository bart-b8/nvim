-- TODO: check if this is called before or after leader is set.
-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- local wk = require("which-key")
local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  vim.notify("which-key not loaded in keymaps.lua")
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)
wk.register({
  b = {
    name = "+buffers&view",
    f = {":Telescope buffers<CR>", "find_buffers"},
    ["|"] = {":vsplit<CR>"},
    ["-"] = {":split<CR>"},
  }
}, { prefix = "<leader>" })

-- Better paste
keymap("v", "p", 'P', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
wk.register({
  e = {
    ":NvimTreeToggle<CR>",
    "nvimtrEetoggle",
  }
}, { prefix = "<leader>" })

-- Telescope
wk.register({
  f = {
    name = "+Telescope",
    f = {":Telescope find_files<CR>", "find files"},
    t = {":Telescope live_grep<CR>", "live_grep"},
    p = {":Telescope projects<CR>", "projects"},
    b = {":Telescope buffers<CR>", "buffers"},
    h = {":Telescope help_tags<CR>", "help_tags"},
    k = {":Telescope keymaps<CR>", "keymaps"},
  }
}, { prefix = "<leader>" })

-- Git
wk.register({
  g = {
    name = "+git",
    g = {function() _LAZYGIT_TOGGLE() end, "lazygit"}
  }
}, { prefix = "<leader>" })

-- Comment
wk.register({
  c = {
    name = "+Comment",
    c = {function() require('Comment.api').toggle.linewise.current() end, "toggle line" },
  }
}, { prefix = '<leader>' })
wk.register({
  c = {
    name = "+Comment",
    c = {"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", "toggle line"},
    b = {"<esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>", "toggle blok"},
  }
}, {prefix = "<leader>", mode = "x"})

-- DAP
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F10>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F9>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", opts)
wk.register({
  d = {
    name = "+dap",
    b = {function() require("dap").toggle_breakpoint() end, "toggle BP" },
    B = {function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, "BP condition" },
    c = {function() require("dap").continue() end, "continue F5" },
    i = {function() require("dap").step_into() end, "step_into F10" },
    o = {function() require("dap").step_over() end, "step_over F9" },
    O = {function() require("dap").step_out() end, "step_out F12" },
    r = {function() require("dap").repl.toggle() end, "repl" },
    l = {function() require("dap").run_last() end, "runlast" },
    u = {function() require("dapui").toggle() end, "dapui_toggle" },
    t = {function() require("dap").terminate() end, "terminate" },
    }
}, { prefix = "<leader>" })

-- Lsp
wk.register({
  l = {
    name = "+lsp",
    f = {function() vim.lsp.buf.format{ async = true } end, "format" },
  }
}, { prefix = "<leader>" })

-- vsTasks

wk.register({
  t = {
    name = "vs-tasks",
    a = { function() require("telescope").extensions.vstask.tasks() end, "Tasks All"},
    i = { function() require("telescope").extensions.vstask.inputs() end, "Open Input list"},
    h = { function() require("telescope").extensions.vstask.history() end, "History"},
    l = { function() require("telescope").extensions.vstask.launch() end, "Launch"},
    c = { function() require("telescope").extensions.vstask.close() end, "close if toggle term"},
  }
}, { prefix = "<leader>" })
