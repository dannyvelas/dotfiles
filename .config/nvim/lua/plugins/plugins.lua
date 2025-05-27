return {
  -- gruvbox
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  -- my plugins
  "tpope/vim-fugitive",
  "tpope/vim-rsi",
  -- edit stuff
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- add a keymap to complete for <c-x><c-f>
      {
        "<C-x><C-f>",
        mode = { "i" },
        function()
          require("fzf-lua").complete_path()
        end,
        desc = "Fuzzy complete file",
        silent = true,
      },
    },
  },
  -- disable stuff
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
}
