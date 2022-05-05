function on_attach(client, bufnr)
  -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
  -- the resolved capabilities of the eslint server ourselves!
  client.resolved_capabilities.document_formatting = true
end

return {
  attach = on_attach
}