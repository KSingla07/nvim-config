require("mason-null-ls").setup({
  ensure_installed = {
    -- For Golang
    "gofumpt",
    "goimports-reviser",
    "golines",
    "delve",
    "gomodifytags",
    "gotests",
    "impl",
    "iferr",

    -- Typescript
    "eslint-lsp",
    "prettier",

    -- SQL
    "sqlfmt",
    "sql-formatter",

    -- Lua
    "stylua",

    -- Nginx LSP
    "nginx-language-server",
  },
})
