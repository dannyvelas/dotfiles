-------------------------------------------------------------------------------------------------------------------------------------------------------
-- configs from my .vimrc that were also in https://github.com/MartinLwx/dotfiles/blob/394a8cc9dc95c3cbbd0eff014943c7228a545f14/nvim/lua/options.lua --
-------------------------------------------------------------------------------------------------------------------------------------------------------
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 
vim.opt.mouse = 'a'                 -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 2                 -- number of visual spaces per TAB
vim.opt.softtabstop = 2             -- number of spacesin tab when editing
vim.opt.shiftwidth = 2              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true               -- show absolute number when cursor is on a given line
vim.opt.relativenumber = true       -- when cursor is not on a given line, show the distance from current line to that line
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.showmode = true             -- show if we are in insert mode

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = false            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- these configs were only on https://github.com/MartinLwx/dotfiles/blob/394a8cc9dc95c3cbbd0eff014943c7228a545f14/nvim/lua/options.lua and NOT on my .vimrc --
--------------------------------------------------------------------------------------------------------------------------------------------------------------
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
--vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- these configs were only on my .vimrc and NOT on https://github.com/MartinLwx/dotfiles/blob/394a8cc9dc95c3cbbd0eff014943c7228a545f14/nvim/lua/options.lua --
--------------------------------------------------------------------------------------------------------------------------------------------------------------
vim.opt.wrap = false                -- dont wrap lines if they exceed the length of the window
vim.opt.sidescroll = 5              -- make side scrolling faster
vim.opt.autoindent = true           -- copy indent from previous line to new line
vim.opt.smartindent = true          -- Do smart autoindenting when starting a new line
vim.opt.foldmethod = 'indent'       -- by default, fold code by indent
vim.opt.showcmd = true              -- allows me to see commands in status line
vim.opt.hidden = true               -- allow me to navigate away from buffers without saving
