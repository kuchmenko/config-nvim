local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    typescript = { "prettier", "eslint_d" },
    typescriptreact = { "prettier", "eslint_d" },
    toml = { "taplo" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {
    taplo = {
      command = "taplo",
      args = { "format", "--option", "indent_string=    ", "-" },
    },
  },
}

return options
