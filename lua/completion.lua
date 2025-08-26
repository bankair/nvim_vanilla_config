vim.pack.add({
  "https://github.com/supermaven-inc/supermaven-nvim",
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
})

require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = "<C-Tab>",
    accept_word = "<C-Space>",
  },
})

cmp = require'cmp'
cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'supermaven' },
  },

  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
}

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['ruby-lsp'].setup {
  capabilities = capabilities
}
