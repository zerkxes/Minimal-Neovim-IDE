require "zerkxes.options"
require "zerkxes.keymaps"
vim.cmd "colorscheme evening"
require "zerkxes.plugins"
pcall(vim.cmd, 'colorscheme onedark')
require "zerkxes.cmp"
--require("mason").setup()
--require "zerkxes.mason"
--require("mason-lspconfig").setup()
--require("lspconfig").jdtls.setup()
--require'lspconfig'.clangd.setup{}
