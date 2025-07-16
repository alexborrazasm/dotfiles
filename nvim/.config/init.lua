if vim.g.vscode then 
  -- VSCode extension
else
  require("lazy").setup()
  -- ordinary Neovim
  vim.opt.syntax = "on"
  vim.opt.number = true
  vim.opt.relativenumber = true
  -- Use spaces
  vim.opt.expandtab = true
  -- 2 spaces
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.softtabstop = 2
end

-- All
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
