-- HTTP Server management: 
-- TODO: only run this section when an index.html file is in project
-- TODO: return focus to neovim
-- TODO: auto update on buffer write (should only be a autocommand when http_server is running)
-- TODO: replace the name localhost into a hardcoded adress 127.0.0.1.

vim.g.http_server = 0

vim.api.nvim_create_user_command('HttpStart', function()
  local http_server = vim.g.http_server

  if http_server <= 0 then
    http_server = vim.fn.jobstart('python3 -m http.server 4500 --bind 127.0.0.1', {stderr_buffered = true})
    vim.g.http_server = http_server
  end

  local uv = vim.loop
  local handle
  local on_exit = function(status)
    print('chrome is being opened. exited ...', status)
    uv.close(handle)
  end

  handle = uv.spawn('cmd.exe', { args = {'/C', 'start', 'http://localhost:4500'}}, on_exit) -- works in wsl or windows (last one is to be tested)
end, {})

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

