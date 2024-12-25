local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-h>", builtin.find_files, {})
vim.keymap.set("n", "<leader>rr", builtin.live_grep, {})
vim.keymap.set("n", "<leader>tb", builtin.buffers, {})

-- <leader>ta: Search all file names, including gitignored and hidden files
vim.keymap.set("n", "<leader>ta", function()
  builtin.find_files({
    hidden = true,
    no_ignore = true,
  })
end, {})

-- <leader>ra: Grep all files, including gitignored and hidden files
vim.keymap.set("n", "<leader>ra", function()
  builtin.live_grep({
    additional_args = function()
      return { "--hidden", "--no-ignore" }
    end,
  })
end, {})
