-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- define common options
local opts = {
  noremap = true, -- non-recursive
  silent = true, -- do not show message
}

-----------------
--  Lazy Vim   --
-----------------
-- don't use H and L for buffers. H is top of viewport and L is bottom of viewport
vim.keymap.del("n", "<s-h>")
vim.keymap.del("n", "<s-l>")

------------------------------------------------------
--  delete without writing to the unnamed register  --
------------------------------------------------------
-- the only key that deletes and writes to the unnamed register is x in visual mode
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "X", '"_X', opts)
vim.keymap.set("n", "c", '"_c', opts)
vim.keymap.set("n", "C", '"_C', opts)
vim.keymap.set("n", "d", '"_d', opts)
vim.keymap.set("n", "D", '"_D', opts)

vim.keymap.set("v", "c", '"_c', opts)
vim.keymap.set("v", "d", '"_d', opts)
vim.keymap.set("v", "P", '"_dP', opts)
vim.keymap.set("v", "p", '"_dp', opts)

-----------------
-- Insert mode --
-----------------
-- shortcut to merge text of line with end of previous line
vim.keymap.set("i", ",e", '<Esc>^"_d0i<Bs>', opts)

-----------------
-- Normal mode --
-----------------
vim.keymap.set("n", "<leader>gg", ":vertical rightbelow G<CR>")
