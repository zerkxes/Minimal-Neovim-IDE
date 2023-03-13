require("mason").setup()
require("mason-lspconfig").setup{
  automatic_installation=true,
}

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
