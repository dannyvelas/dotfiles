-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-- Hint: see `:h vim.map.set()`

-----------------
--  All modes  --
-----------------
-- delete without writing to the unnamed register
-- note: that with this config, the only key that deletes and writes to the unnamed register is x in visual mode
vim.keymap.set('n', 'x', '"_x', opts)
vim.keymap.set('n', 'X', '"_X', opts)
vim.keymap.set('n', 'c', '"_c', opts)
vim.keymap.set('n', 'C', '"_C', opts)
vim.keymap.set('n', 'd', '"_d', opts)
vim.keymap.set('n', 'D', '"_D', opts)

vim.keymap.set('v', 'c', '"_c', opts)
vim.keymap.set('v', 'd', '"_d', opts)
vim.keymap.set('v', 'P', '"_dP', opts)
vim.keymap.set('v', 'p', '"_dp', opts)

-----------------
-- Normal mode --
-----------------

-- Open fugitive menu
vim.keymap.set('n', '<leader>g', ':vertical rightbelow G<CR>', opts)

-----------------
-- Visual mode --
-----------------
