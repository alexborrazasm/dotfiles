if vim.g.vscode then
  -- VSCode extension
  -- System clipboard shortcuts
  vim.keymap.set("n", "<Space>y", '"+y', { noremap = true, silent = true })
  vim.keymap.set("v", "<Space>y", '"+y', { noremap = true, silent = true })
  vim.keymap.set("x", "<Space>y", '"+y', { noremap = true, silent = true })
  vim.keymap.set("n", "<Space>d", '"+d', { noremap = true, silent = true })
  vim.keymap.set("v", "<Space>d", '"+d', { noremap = true, silent = true })
  vim.keymap.set("x", "<Space>d", '"+d', { noremap = true, silent = true })
  vim.keymap.set("n", "<Space>p", '"+p', { noremap = true, silent = true })
  vim.keymap.set("n", "<Space>P", '"+P', { noremap = true, silent = true })
  vim.keymap.set("v", "<Space>p", '"+p', { noremap = true, silent = true })
  vim.keymap.set("v", "<Space>P", '"+P', { noremap = true, silent = true })
else
  -- ordinary Neovim
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
end
