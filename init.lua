require "zerkxes.options"
require "zerkxes.keymaps"
require "zerkxes.plugins"
--pcall(vim.cmd, 'colorscheme tokyonight-moon')
--pcall(vim.cmd, 'colorscheme codedark')--use this for vscode dark
pcall(vim.cmd, 'colorscheme gruvbox')--use this for gruvbox dark
require "zerkxes.cmp"
require "zerkxes.mason"
require "zerkxes.lspconf"
require "zerkxes.emmet"
require "zerkxes.treesitter"
