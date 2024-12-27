local builtin = require("telescope.builtin")

-- search all file names, including gitignored and hidden files
vim.keymap.set("n", "<C-h>", function()
  builtin.find_files({
    hidden = true,
    no_ignore = true,
  })
end, {})

-- grep all files, including gitignored and hidden files
vim.keymap.set("n", "<leader>rr", function()
  builtin.live_grep({
    additional_args = function()
      return { "--hidden", "--no-ignore" }
    end,
  })
end, {})

-- telescope mini: search all files names not including gitignored and hidden files
vim.keymap.set("n", "<leader>tm", function()
  builtin.find_files({
    hidden = false,
    no_ignore = false,
  })
end, {})


-- grep mini: search all files names not including gitignored and hidden files
vim.keymap.set("n", "<leader>rm", builtin.live_grep, {})

-- telescope on buffers
vim.keymap.set("n", "<leader>tb", builtin.buffers, {})

-- dont make telescope results fold
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function()
    vim.opt_local.foldenable = false
  end,
})
