-- load telescope
local builtin = require("telescope.builtin")

-- make telescope use fzf
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
require('telescope').load_extension('fzf')

-- telescope mini: search all files names not including gitignored and hidden files
vim.keymap.set("n", "<C-h>", function()
  builtin.find_files({
    hidden = false,
    no_ignore = false,
  })
end, { noremap = true, silent = true })

-- search all file names, including gitignored and hidden files
vim.keymap.set("n", "<leader>ta", function()
  builtin.find_files({
    hidden = true,
    no_ignore = true,
  })
end, { noremap = true, silent = true })

-- find files in different directory
vim.keymap.set("n", "<leader>td", function()
  builtin.find_files({
    cwd = vim.fn.input("Directory: ", "", "dir"),
    hidden = false,
    no_ignore = false,
  })
end, { noremap = true, silent = true })

-- telescope on buffers
vim.keymap.set("n", "<leader>tb", builtin.buffers, { noremap = true, silent = true })

-- telescope for git branches
vim.keymap.set("n", "<leader>tg", builtin.git_branches, { noremap = true, silent = true })

-- grep mini: search all files names not including gitignored and hidden files
vim.keymap.set("n", "<leader>rr", builtin.live_grep, { noremap = true, silent = true })

-- grep all files, including gitignored and hidden files
vim.keymap.set("n", "<leader>ra", function()
  builtin.live_grep({
    additional_args = function()
      return { "--hidden", "--no-ignore" }
    end,
  })
end, { noremap = true, silent = true })


-- dont make telescope results fold
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function()
    vim.opt_local.foldenable = false
  end,
})
