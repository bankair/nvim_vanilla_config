vim.pack.add({ "https://github.com/folke/trouble.nvim" })

require("trouble").setup({
  opts = {
  },

  vim.keymap.set('n', '<leader>xx', "<cmd>Trouble diagnostics toggle<cr>", { desc = 'Toggle Diagnostics' }),
  vim.keymap.set('n', '<leader>xd', "<cmd>Trouble lsp toggle<cr>", { desc = 'LSP Defs' })
})
