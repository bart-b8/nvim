local M = {}

-- Servers Mason will ensure install and lsp-config will attach to relevant buffers.
M.servers = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "ltex"
}

return M
