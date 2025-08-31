require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
  },
})


require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
 capabilities = capabilities,
}

require("lspconfig").clangd.setup {
    cmd = {
      "clangd",
      "--header-insertion=never",
      "--query-driver=/usr/lib/llvm-10/bin/clang",
      "--all-scopes-completion",
      "--completion-style=detailed",
    }
}
