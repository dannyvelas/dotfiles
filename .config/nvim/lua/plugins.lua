local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- colorscheme
    "morhetz/gruvbox",
    -- Vscode-like pictograms
    {
        "onsails/lspkind.nvim",
        event = { "VimEnter" },
    },
    -- Auto-completion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
            "hrsh7th/cmp-buffer", -- buffer auto-completion
            "hrsh7th/cmp-path", -- path auto-completion
            "hrsh7th/cmp-cmdline", -- cmdline auto-completion
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },
    -- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        config = function()
            require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets"})
        end,
    },
    -- LSP manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- Add hooks to LSP to support Linter && Formatter
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            -- Note:
            --     the default search path for `require` is ~/.config/nvim/lua
            --     use a `.` as a path seperator
            --     the suffix `.lua` is not needed
            require("config.mason-null-ls")
        end,
    },
    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("config.telescope")
        end,
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    -- Git
    "tpope/vim-fugitive",
    {
      "ggandor/leap.nvim",
      config = function()
        -- See `:h leap-custom-mappings` for more details
        require("leap").create_default_mappings()
      end,
    },
    -- file explorer
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
          "nvim-tree/nvim-web-devicons",
        },
        config = function()
          require("config.nvim-tree")
        end,
    },
    -- CSV Formatter
    {
      "godlygeek/tabular",
    },
    -- prettier
    {
      "MunifTanjim/prettier.nvim",
      dependencies = {
        "neovim/nvim-lspconfig",
        "nvimtools/none-ls.nvim",
      }
    },
    -- lang specific stuff
    {
      "jparise/vim-graphql",
    },
    {
      "bfrg/vim-jq"
    }
})
