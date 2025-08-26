vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'main' },
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
})

local ts_parsers = {
  "bash",
  "c",
  "dockerfile",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "html",
  "javascript",
  "json",
  "lua",
  "make",
  "markdown",
  "python",
  "rust",
  "ruby",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "yaml",
}
local nts = require("nvim-treesitter")
nts.install(ts_parsers)
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
      local ok = pcall(vim.cmd, 'TsUpdate')
      if not ok then
        vim.notify('TsUpdate failed!', vim.log.levels.WARN)
      end
    end
  end,
})
