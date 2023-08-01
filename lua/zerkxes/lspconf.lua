-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer=bufnr,
    callback=function ()
      local opts = {
        focusable=false;
        close_events= {"BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border= 'rounded',
        source='always',
        prefix='';
        scope='cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require'lspconfig'.gopls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
--require'lspconfig'.eslint.setup{
--    --cmd={"vscode-eslint-language-server", "--stdio" },
--    on_attach = on_attach,
--    flags = lsp_flags,
--    root_dir=function() return vim.loop.cwd() end
-- }

--require('lspconfig')['tsserver'].setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
--    root_dir=function() return vim.loop.cwd() end
--    -- Server-specific settings...
--    }
require'lspconfig'.clangd.setup{
    on_attach=on_attach,
    flags=lsp_flags,
  }
  require'lspconfig'.lua_ls.setup{
    on_attach=on_attach,
    flags=lsp_flags,
  }
--  require'lspconfig'.jdtls.setup {
--    cmd={"jdtls"},
--    init_options={ jvm_args={}, workspace="home/runner/.cache/jdtls/workspace"},
--    single_file_support=true,
--    on_attach=on_attach,
--    root_dir=function() return vim.loop.cwd() end
--  }

