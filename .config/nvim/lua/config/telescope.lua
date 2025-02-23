-- load telescope
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

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
  -- Use Telescope to pick a directory first
  builtin.find_files({
    prompt_title = "Select Directory",
    cwd = "/Users/dannyvelasquez",
    find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git", "--no-ignore" }, -- Only search for directories
    attach_mappings = function(prompt_bufnr, map)
      local function enter()
        local selection = action_state.get_selected_entry()
        if selection then
          local dir = selection[1] -- Get the selected directory
          actions.close(prompt_bufnr)
          -- Now open find_files inside the selected directory
          builtin.find_files({ cwd = dir })
        end
      end
      map("i", "<CR>", enter)
      map("n", "<CR>", enter)
      return true
    end,
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
