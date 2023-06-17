-- TODO: evaluate if all my prefered keymaps are still available. If not: ? new keymap usable? otherwise change.
require "options"
require "keymaps"
require "Lazy"
require "autocommands"

-- code down here is temporary. 
-- TODO: <after testing> select a more appropriate place this code can live in. And preferrably, only is loaded when working in on a web application.
-- Start Local host server. ??? How to run this parrallel.

local http_server = 0
vim.g.http_server = http_server

vim.api.nvim_create_user_command('HttpStart', function()
  local http_server = vim.g.http_server
  if http_server <= 0 then
    http_server = vim.fn.jobstart('python3 -m http.server --bind 127.0.0.1', {stderr_buffered = true})
    vim.g.http_server = http_server
  end
  -- os.execute('cmd.exe /C start http://localhost:8000') -- Works only from WSL (Ubuntu) but creates weird thing in buffer.
  local uv = vim.loop
  local handle
  local on_exit = function(status)
    print('chrome is being opened. exited ...', status)
    uv.close(handle)
  end
  handle = uv.spawn('cmd.exe', { args = {'/C', 'start', 'http://localhost:8000'}}, on_exit)
end, {}) -- Couple of problems I'm thinking of. How are return values handeld? Should I use a global variable that can be updated with the job_id when that job is running?

vim.api.nvim_create_user_command('HttpStop', function()
  local http_server = vim.g.http_server
  if http_server > 0 then
    local stop = vim.fn.jobstop(http_server)
    if stop == 1 then
      http_server = 0
      vim.g.http_server = http_server
    end
  end
end, {})

-- Open chrome tab to local host

-- Refresh chrome after buffer write
