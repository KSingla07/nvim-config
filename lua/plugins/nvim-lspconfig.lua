-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    -- LSP Management
    -- https://github.com/williamboman/mason.nvim
    { "williamboman/mason.nvim" },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { "williamboman/mason-lspconfig.nvim" },

    -- Useful status updates for LSP
    -- https://github.com/j-hui/fidget.nvim
    { "j-hui/fidget.nvim",                opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/neodev.nvim
    { "folke/neodev.nvim" },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "gopls",
        "dockerls",
        "bashls",
        "yamlls",
      },
    })

    local lspconfig = require("lspconfig")
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
    end

    -- Call setup on each LSP server
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        })
      end,
    })

    -- Lua LSP settings
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
        },
      },
    })
    local util = require("lspconfig/util")
    -- Gopls LSP settings
    lspconfig.gopls.setup({
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          staticcheck = true,
          semanticTokens = true,
        },
      },
    })

    lspconfig.yamlls.setup({})
    lspconfig.dockerls.setup({})
    lspconfig.bashls.setup({})
    lspconfig.nginx_language_server.setup({})
  end,
}
