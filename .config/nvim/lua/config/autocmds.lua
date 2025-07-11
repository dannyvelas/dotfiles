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
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    -- if you scroll past one logical line that wraps "n" visual lines, dont let the viewport
    -- jump "n" lines down at once. rather, make the viewport only scroll one line.
    -- this is useful when you are scrolling through paragraphs and you want the top of the viewport to
    -- be able to be at the middle of some paragraph.
    vim.opt_local.smoothscroll = true
    -- visually indent wrapped lines a little bit
    vim.opt.breakindent = true
    -- these are the options for breakindent set above
    -- visually indent wrapped lines so that it looks like
    -- the wrapped part of the line is 2 spaces to the right of
    -- the start of the line
    -- don't add indents to lines that are < 40 characters
    vim.opt_local.breakindentopt = "shift:2,min:40"

    -- in normal mode, only in this buffer, if <number>j is pressed, go down <number> logical lines
    -- however, if j is pressed without a number, go down 1 visual line.
    -- same thing for k
    vim.keymap.set("n", "j", function()
      return vim.v.count == 0 and "gj" or "<Esc>" .. vim.v.count .. "j"
    end, { expr = true, noremap = true, buffer = 0 })
    vim.keymap.set("n", "k", function()
      return vim.v.count == 0 and "gk" or "<Esc>" .. vim.v.count .. "k"
    end, { expr = true, noremap = true, buffer = 0 })
  end,
})
