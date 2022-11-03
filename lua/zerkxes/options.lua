local options = {
	backup=false,
	clipboard="unnamedplus",
	completeopt={"menuone","noselect"},
	conceallevel=0,
	fileencoding="utf-8",
	hlsearch=true,
	ignorecase=true,
	mouse="a",
	pumheight=10,
	showtabline=2,
	smartcase=true,
	smartindent=true,
	splitbelow=true,
	splitright=true,
	swapfile=false,
  termguicolors=true,   --do not touch this shit, looks horrible
	timeoutlen=300,
	undofile=true,
	updatetime=300,
	writebackup=false,
	expandtab=true,
	shiftwidth=2,
	tabstop=2,
	cursorline=true,
	number=true,
	relativenumber=true,
	signcolumn="yes",
	wrap=false,
	scrolloff=8,
	sidescrolloff=8,
	guicursor="",
}
vim.opt.shortmess:append "c"
for k,v in pairs(options) do
	vim.opt[k]=v
end
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
