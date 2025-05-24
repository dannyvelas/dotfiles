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

-----------------------
-- Readline bindings --
-----------------------
vim.keymap.set("i", "<C-A>", "<C-O>^", opts) -- front of line insert mode
vim.keymap.set("i", "<C-e>", "<End>", opts) -- end of line insert mode (command mode is not needed bc it already works out the box)
vim.keymap.set("i", "<C-f>", "<Right>", opts) -- move cursor to the right insert mode. note: we will add this to command mode below
vim.keymap.set("i", "<C-b>", "<Left>", opts)

-- TODO: add support for opening cmd history pane if cursor is at EOL
-- NOTE: when i add silent=true, this stops working
vim.keymap.set("c", "<C-f>", function()
  return "<Right>"
end, { noremap = true, expr = true }) -- move cursor to the right command mode
vim.keymap.set("c", "<C-A>", function()
  return "<Home>"
end, { noremap = true, expr = true }) --front of line command mode
vim.keymap.set("c", "<C-B>", function()
  return "<Left>"
end, { noremap = true, expr = true }) -- move cursor to the left command mode

-- in command mode, <C-A> was set to move the cursor to the beginning of line
-- but <C-A> was doing something else before, (pasting out all of the options into the command line)
-- we still want that functionality
-- so, lets do <C-X><C-A> when we want that functionalality
vim.keymap.set("c", "<C-X><C-A>", "<C-A>")

-- tried to translate this to Lua with ChatGPT but couldn't hack it: vim.keymap.set("c", "<C-k>", function() local line = vim.fn.getcmdline() local pos = vim.fn.getcmdpos() return line:sub(1, pos - 1) end, { noremap = true, expr = true })
vim.cmd("cnoremap <C-k> <c-\\>egetcmdline()[:getcmdpos()-2]<CR>") -- delete everything past point.

-- meta key bindings insert mode
vim.keymap.set("i", "<M-b>", "<S-Left>", opts)
vim.keymap.set("i", "<M-f>", "<S-Right>", opts)
vim.keymap.set("i", "<M-d>", "<C-O>dw", opts)
-- meta key bindings command mode
vim.keymap.set("c", "<M-b>", function()
  return "<S-Left>"
end, { noremap = true, expr = true })
vim.keymap.set("c", "<M-f>", function()
  return "<S-Right>"
end, { noremap = true, expr = true })
vim.keymap.set("c", "<M-d>", function()
  return "<S-Right><C-W>"
end, { noremap = true, expr = true })

-----------------
-- Insert mode --
-----------------
-- shortcut to merge text of line with end of previous line
vim.keymap.set("i", ",e", '<Esc>^"_d0i<Bs>', opts)

-----------------
-- Normal mode --
-----------------
vim.keymap.set("n", "<leader>gg", ":vertical rightbelow G<CR>")
