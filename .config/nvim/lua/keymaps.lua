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

-----------------------
-- Readline bindings --
-----------------------
vim.keymap.set('i', '<C-A>', '<C-O>^', opts) -- front of line insert mode
vim.keymap.set('i', '<C-e>', '<End>', opts) -- end of line insert mode (command mode is not needed bc it already works out the box)
vim.keymap.set('i', '<C-D>', '<Delete>', opts) -- delete at point insert mode
vim.keymap.set('i', '<C-f>', '<Right>', opts) -- move cursor to the right insert mode. note: we will add this to command mode below
vim.keymap.set('i', '<C-b>', '<Left>', opts)

-- TODO: add support for opening cmd history pane if cursor is at EOL
-- NOTE: when i add silent=true, this stops working
vim.keymap.set('c', '<C-f>', function() return "<Right>" end, { noremap = true, expr = true }) -- move cursor to the right command mode
vim.keymap.set('c', '<C-A>', function() return '<Home>' end, { noremap = true, expr = true }) --front of line command mode
vim.keymap.set('c', '<C-B>', function() return '<Left>' end, { noremap = true, expr = true }) -- move cursor to the left command mode

-- in command mode, <C-A> was set to move the cursor to the beginning of line
-- but <C-A> was doing something else before, (pasting out all of the options into the command line)
-- we still want that functionality
-- so, lets do <C-X><C-A> when we want that functionalality
vim.keymap.set('c', '<C-X><C-A>', '<C-A>')

-- TODO: translate this to lua
vim.cmd 'cnoremap <C-k> <c-\\>egetcmdline()[:getcmdpos()-2]<CR>' -- delete everything past point. 

-- meta key bindings insert mode
vim.keymap.set('i', '<M-b>', '<S-Left>', opts)
-- meta key bindings command mode
vim.keymap.set('c', '<M-b>', function() return '<S-Left>' end, { noremap = true, expr = true })
vim.keymap.set('c', '<M-f>', function() return '<S-Right>' end, { noremap = true, expr = true })
vim.keymap.set('c', '<M-d>', function() return '<S-Right><C-W>' end, { noremap = true, expr = true })


-----------------
-- Normal mode --
-----------------

-- Open fugitive menu
vim.keymap.set('n', '<leader>g', ':vertical rightbelow G<CR>', opts)

-- open file explorer
vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<CR>', opts)

-----------------
-- Insert mode --
-----------------
-- shortcut to merge text of line with end of previous line
vim.keymap.set('i', ',e', '<Esc>^"_d0i<Bs>', opts)

-- digraphs
vim.keymap.set('i', '<C-\\>', '<C-k>', opts)

-- i'd rather use c-d as a readline binding for deleting at point than shifting left
-- so, i'll make c-t inherit the behavior of c-d
-- if c-t is shift-left, then there's no way to shift right.
-- i'l make c-y shift right since it's not being used for anything and it's to the right of c-t
vim.keymap.set('i', '<C-t>', '<C-d>', opts)
vim.keymap.set('i', '<C-y>', '<C-t>', opts)
