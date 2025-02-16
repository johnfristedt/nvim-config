local lspconfig = require('lspconfig')

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'pyright',
  }
})

-- Enable LSP servers
-- TypeScript/JavaScript LSP setup
lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    -- Keybindings for LSP
    local opts = { noremap = true, silent = true }
    local buf_set_keymap = vim.api.nvim_buf_set_keymap
    buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>oi',
      '<Cmd>lua vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.api.nvim_buf_get_name(0) } })<CR>',
      opts)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
lspconfig.html.setup {}   -- HTML
lspconfig.cssls.setup {}  -- CSS
lspconfig.jsonls.setup {} -- JSON
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

lspconfig.efm.setup({
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      javascript = {
        { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
      },
      python = {
        { formatCommand = "black --quiet -", formatStdin = true },
      },
    },
  },
  filetypes = { "javascript", "python" },
})

-- Optional: Enable Emmet for faster HTML/CSS writing
lspconfig.emmet_ls.setup {}

-- Python LSP setup
lspconfig.pyright.setup({
  on_attach = function(client, bufnr)
    -- Keybindings for LSP
    local opts = { noremap = true, silent = true }
    local buf_set_keymap = vim.api.nvim_buf_set_keymap
    buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Kotlin LSP setup
lspconfig.kotlin_language_server.setup({
  on_attach = function(client, bufnr)
    -- Keybindings for LSP
    local opts = { noremap = true, silent = true }
    local buf_set_keymap = vim.api.nvim_buf_set_keymap
    buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

lspconfig.efm.setup({
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      javascript = {
        { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
      },
      python = {
        { formatCommand = "black --quiet -", formatStdin = true },
      },
      kotlin = {
        { formatCommand = "ktlint -F --stdin", formatStdin = true },
      },
    },
  },
  filetypes = { "javascript", "python", "kotlin" },
})

-- nvim_lsp.clangd.setup {
--   on_attach = function(client, bufnr)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--     -- Mappings.
--     -- local opts = { noremap = true, silent = true }
--
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
--     --   '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--     -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
--   end,
-- }

local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()              -- Cycle to the next item
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump() -- Jump to the next snippet placeholder
      else
        fallback()                          -- Fallback to regular tab behavior
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()      -- Cycle to the previous item
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1) -- Jump to the previous snippet placeholder
      else
        fallback()                  -- Fallback to regular shift-tab behavior
      end
    end, { 'i', 's' }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm the selection
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
    }),
  },
})

vim.diagnostic.config({
  virtual_text = false, -- Disable virtual text
  signs = true,         -- Keep signs in the gutter
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    show_header = true,
    source = 'always',
    border = 'rounded',
    focusable = false,
  },
})
