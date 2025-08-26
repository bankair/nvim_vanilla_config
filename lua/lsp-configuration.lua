vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.enable({
  "html",
  "jsonls",
  "lua_ls", -- os package mgr: lua-language-server
  "pyright", -- npm i -g pyright
  "ts_ls", -- npm i -g typescript typescript-language-server
  "ruby_lsp",
  "rubocop",
})


local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

autocmd("LspAttach", {
  group = augroup,
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    local bufopts = { noremap = true, silent = true, buffer = ev.buf }
    map("i", "<C-k>", vim.lsp.completion.get, bufopts) -- open completion menu manually
    map("n", "gd", vim.lsp.buf.definition, bufopts)

    local methods = vim.lsp.protocol.Methods
    -- https://github.com/neovim/neovim/blob/b2828af5b5aba044cd40594a519d2d9f5dbb69cb/runtime/lua/vim/lsp/protocol.lua?plain=1#L858
    if client:supports_method(methods.textDocument_completion) then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
