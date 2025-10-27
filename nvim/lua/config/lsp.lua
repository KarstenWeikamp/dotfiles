--- lua/config/lsp.lua

-- Diagnostics and general LSP behavior
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  signs = true,
  update_in_insert = false,
})

-- Set up LSP-specific keymaps via autocommand
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    local map = vim.keymap.set
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  -- Format on InsertLeave (only for buffers with LSP support)
    vim.api.nvim_create_autocmd("InsertLeave", {
      buffer = event.buf,
      callback = function()
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method("textDocument/formatting") then
          vim.lsp.buf.format({ async = true })
        end
      end,
      desc = "Auto-clang-format on InsertLeave",
    })
  end,
})

-- Enable language servers with auto-discovery
vim.lsp.enable({
  "clangd",
  "pyright",
  "rust_analyzer",
  "yamlls",
  "jsonls",
  "taplo",
})

