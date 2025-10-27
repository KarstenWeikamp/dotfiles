return {
  cmd = { "/home/kweikamp/.config/Code/User/globalStorage/llvm-vs-code-extensions.vscode-clangd/install/19.1.2/clangd_19.1.2/bin/clangd", 
        "--background-index",
        "--completion-style=detailed",
        "--pretty",
        "--header-insertion=never",
        "--query-driver=/opt/ti/ti-cgt-armllvm_3.2.2.LTS/bin/tiarmclang",
    },
  filetypes = { "c", "cpp" },
  root_markers = { ".git", "compile_commands.json", "compile_flags.txt" },
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  init_options = {
       compilationDatabasePath = "./",
    },
}

