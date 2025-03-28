-- creds: https://nyinyithan.com/nvim-setup-ocaml/
-- and https://martinlwx.github.io/en/config-neovim-from-scratch/
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
  snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
  },
  mapping = cmp.mapping.preset.insert({
      -- Use <C-b/f> to scroll the docs
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),

      -- Use <CR>(Enter) to confirm selection
      -- select: false makes it so that if there are suggestions, but you didn't pick any
      -- and you click ENTER, a newline will be inserted instead of the first suggestion being inserted
      ['<CR>'] = cmp.mapping.confirm({ select = false }),

      -- A super tab
      -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
      ["<Tab>"] = cmp.mapping(function(fallback)
          -- Hint: if the completion menu is visible select next one
          if cmp.visible() then
              cmp.select_next_item()
          elseif has_words_before() then
              cmp.complete()
          else
              fallback()
          end
      end, { "i", "s" }), -- i - insert mode; s - select mode
      ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_prev_item()
          elseif luasnip.jumpable( -1) then
              luasnip.jump( -1)
          else
              fallback()
          end
      end, { "i", "s" }),
  }),

  -- Let's configure the item's appearance
  -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
  formatting = {
      -- Set order from left to right
      -- kind: single letter indicating the type of completion
      -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
      -- menu: extra text for the popup menu, displayed after "word" or "abbr"
      fields = { 'kind', 'abbr', 'menu' },

      -- customize the appearance of the completion menu
      format = function(entry, vim_item)
          vim_item.menu = ({
              nvim_lsp = '[Lsp]',
              luasnip = '[Luasnip]',
              buffer = '[File]',
              path = '[Path]',
          })[entry.source.name]
          return vim_item
      end,
  },

  -- Set source precedence
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },    -- For nvim-lsp
      { name = 'luasnip' },     -- For luasnip user
      { name = 'buffer' },      -- For buffer word completion
      { name = 'path' },        -- For path completion
  }),
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
