builtin = require("telescope.builtin")
telescope = require('telescope')

vim.keymap.set("n", "<C-h>", builtin.find_files, {})
vim.keymap.set("n", "<leader>rr", builtin.live_grep, {})
