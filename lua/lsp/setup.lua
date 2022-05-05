local lsp_installer = require "nvim-lsp-installer"

-- Installer List
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: language value: config file }
local serverNames = {'bashls', 'cmake', 'clangd', 'cssls', 'dockerls', 'emmet_ls', 'graphql', 'html', 'jsonls', 'tsserver', 'remark_ls', 'pyright', 'taplo', 'volar', 'yamlls', 'diagnosticls', 'grammarly'}
local servers = {
  sumneko_lua = require "lsp.lua",  -- /lua/lsp/lua.lua
  eslint = require "lsp.eslint", 
}

for _, name in pairs(serverNames) do
  servers[name] = {}
end

-- Auto Install LanguageServers
for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = servers[server.name]

  if opts then
    opts.on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      -- Bind shortcut
      require('keybindings').maplsp(buf_set_keymap)
      if opts.attach then opts.attach(client, bufnr) end
    end

    opts.flags = {
      debounce_text_changes = 150,
    }

    server:setup(opts)
  end
end)