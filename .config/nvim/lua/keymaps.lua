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

-- readline bindings
vim.keymap.set('i', '<C-A>', '<C-O>^')
vim.keymap.set('c', '<C-A>', '<Home>')

-- both insert and command mode
vim.keymap.set('!', '<C-X><C-A>', '<C-A>')
vim.keymap.set('!', '<C-B>', '<Left>')
vim.keymap.set('!', '<C-D>', '<Delete>')

-----------------
-- Normal mode --
-----------------

-- Open fugitive menu
vim.keymap.set('n', '<leader>g', ':vertical rightbelow G<CR>', opts)

-----------------
-- Visual mode --
-----------------

-----------------
-- Insert mode --
-----------------
-- shortcut to merge text of line with end of previous line
vim.keymap.set('i', ',e', '<Esc>^"_d0i<Bs>', opts)


-- i'd rather use c-d as a readline binding for deleting at point than shifting left
-- so, i'll make c-t inherit the behavior of c-d
-- if c-t is shift-left, then there's no way to shift right.
-- i'l make c-y shift right since it's not being used for anything and it's to the right of c-t
vim.keymap.set('i', '<C-t>', '<C-d>', opts)
vim.keymap.set('i', '<C-y>', '<C-t>', opts)
