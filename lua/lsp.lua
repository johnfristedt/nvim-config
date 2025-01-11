local lspconfig = require('lspconfig')

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
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
lspconfig.html.setup {}      -- HTML
lspconfig.cssls.setup {}     -- CSS
lspconfig.jsonls.setup {}    -- JSON

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
        cmp.select_next_item() -- Cycle to the next item
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump() -- Jump to the next snippet placeholder
      else
        fallback() -- Fallback to regular tab behavior
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item() -- Cycle to the previous item
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1) -- Jump to the previous snippet placeholder
      else
        fallback() -- Fallback to regular shift-tab behavior
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