if vim.g.vscode then
  -- VSCode extension
  -- System clipboard shortcuts
  local opts = { noremap = true, silent = true }

  -- copy
  vim.keymap.set({ "n", "v", "x" }, "<Space>y", '"+y', opts)

  -- cut
  vim.keymap.set({ "n", "v", "x" }, "<Space>d", '"+d', opts)

  -- paste
  vim.keymap.set({ "n", "v" }, "<Space>p", '"+p', opts)
  vim.keymap.set({ "n", "v" }, "<Space>P", '"+P', opts)
else
  -- ordinary Neovim
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
end
