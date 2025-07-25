-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- visually indent wrapped lines a little bit
    vim.opt.breakindent = true
    -- these are the options for breakindent set above
    -- visually indent wrapped lines so that it looks like
    -- the wrapped part of the line is 2 spaces to the right of
    -- the start of the line
    -- don't add indents to lines that are < 40 characters
    vim.opt_local.breakindentopt = "shift:2,min:40"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json" },
  callback = function()
    vim.b.autoformat = false
  end,
})
