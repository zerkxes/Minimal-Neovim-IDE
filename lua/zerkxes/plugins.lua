local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


-- Install your plugins here
return packer.startup(function(use)
use { "wbthomason/packer.nvim" }
use { "nvim-lua/plenary.nvim" }
use { "nvim-lua/popup.nvim", commit="b7404d35d5d3548a82149238289fa71f7f6de4ac" }
use { "joshdick/onedark.vim" }
use({ "nvim-treesitter/nvim-treesitter", commit="31f608e47b838594d32a7bc42028e2cefd0ddaad" })
use { "folke/tokyonight.nvim" }
use { "tomasiser/vim-code-dark" }
use { "ellisonleao/gruvbox.nvim" }



--CMP plugins --
use { "hrsh7th/nvim-cmp" ,commit="51f1e11a89ec701221877532ee1a23557d291dd5"}
use { "hrsh7th/cmp-buffer", commit="3022dbc9166796b644a841a02de8dd1cc1d311fa" }
use { "hrsh7th/cmp-path", commit="91ff86cd9c29299a64f968ebb45846c485725f23" }
use { "hrsh7th/cmp-cmdline", commit="8ee981b4a91f536f52add291594e89fb6645e451" }
use { "saadparwaiz1/cmp_luasnip", commit="18095520391186d634a0045dacaa346291096566" }
use { "hrsh7th/cmp-nvim-lsp", commit="44b16d11215dce86f253ce0c30949813c0a90765" }


--Snippets and snippet engine
use { "L3MON4D3/LuaSnip" } -- snippet engine
use { "rafamadriz/friendly-snippets" } -- bunch of snippets to use

--Mason nvim and LspConfig
use {"williamboman/mason.nvim", commit="a51c2d063c5377ee9e58c5f9cda7c7436787be72" }
use {"williamboman/mason-lspconfig.nvim", commit="2997f467881ac4faa6f8c5e7065e3a672297c8ad" }
use {"neovim/nvim-lspconfig", commit="f7922e59aeb9bc3e31a660ea4e7405ffa3fc2c3a" }

--emmet ls 
use {"mattn/emmet-vim"}

if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
