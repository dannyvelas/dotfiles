-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.timeoutlen = 1000 -- make timeoutlen 1 second so that it's easier to press <c-x><c-a> in command line mode
vim.opt.showmode = true -- not using lualine so i need this
vim.opt.laststatus = 2 -- not using lualine so i want one status line per window
vim.opt.ruler = true
