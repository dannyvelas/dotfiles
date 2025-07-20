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
  {
    {
      "quarto-dev/quarto-nvim",
      dependencies = {
        "jmbuhr/otter.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
    },
  },
  -- configure stuff
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = {
            -- When `true`, will automatically select the first item in the completion list
            preselect = false,
            -- preselect = function(ctx) return vim.bo.filetype ~= 'markdown' end,

            -- When `true`, inserts the completion item automatically when selecting it
            -- You may want to bind a key to the `cancel` command (default <C-e>) when using this option,
            -- which will both undo the selection and hide the completion menu
            auto_insert = false,
            -- auto_insert = function(ctx) return vim.bo.filetype ~= 'markdown' end
          },
        },
      },
    },
  },
  -- disable stuff
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
      -- indent guides make vim way too slow for large files
      indent = { enabled = false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
}
