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
    -- if you are scroll past one logical line that wraps "n" visual lines, dont let the viewport
    -- jump "n" lines down at once. rather, make the viewport only scroll one line.
    -- this is useful when you are scrolling through paragraphs and you want the top of the viewport to
    -- be able to be at the middle of some paragraph.
    vim.opt_local.smoothscroll = true
    -- visually indent wrapped lines a little bit
    vim.opt.breakindent = true
    -- these are the options for breakindent set above
    -- indent wrapped lines by 2 spaces
    -- don't add indents to lines that are < 40 characters
    vim.opt_local.breakindentopt = "shift:2,min:40"

    -- in normal mode, only in this buffer, if <number>j is pressed, go down <number> logical lines
    -- however, if j is pressed without a number, go down 1 visual line.
    -- same thing for k
    --vim.api.nvim_buf_set_keymap(0, "n", "j", "v:count == 0 and 'gj' or ('\\<Esc>' .. v:count .. 'j')", { expr = true, noremap = true })
    --vim.api.nvim_buf_set_keymap(0, "n", "k", "v:count == 0 and 'gk' or ('\\<Esc>' .. v:count .. 'k')", { expr = true, noremap = true })
  end,
})
