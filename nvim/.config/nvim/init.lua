--if vim.g.vscode then
--  -- VSCode extension
--else
--  -- ordinary Neovim
--  -- bootstrap lazy.nvim, LazyVim and your plugins
--  require("config.lazy")
--end
--
--------------------
-- Core
--------------------
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.termguicolors = true
vim.g.mapleader = " "


--------------------
-- Clipboard (OSC52 Native)
--------------------
vim.o.clipboard = "unnamedplus"

local function copy_osc52()
  return require('vim.ui.clipboard.osc52').copy('+')
end

vim.keymap.set("v", "<leader>y", function()
  vim.cmd('normal! "+y')
end, { desc = "Copy to system clipboard via OSC52" })

vim.keymap.set("n", "gy", '"+yy', { noremap = true, desc = "Copy line to OSC52" })

--------------------
-- Keymaps
--------------------
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
