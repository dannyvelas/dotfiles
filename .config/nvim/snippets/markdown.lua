local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

-- Function to get the current filename without the directory or extension
local function get_filename()
  local full_path = vim.fn.expand("%:t") -- Get the current file's name
  local name = full_path:gsub("%.%w+$", "") -- Remove the extension
  name = name:gsub("-", " ") -- Replace '-' with space
  name = name:gsub("^%s*(.-)%s*$", "%1") -- Trim leading/trailing whitespace
  name = name:gsub("^(%l)", string.upper) -- Capitalize the first character if alphabetic
  return name
end

-- this snippet adds a frontmatter with a title/date/publish field, and under that,
-- a paragraph that looks like this: "Tags: [[]]"
-- on <C-l>, the cursor will jump to the value of "title", then the value of "publish",
-- then inside of the nested brackets after "Tags:".
-- By default, the value of "title" will be set to the name of the file.
-- The value of "date" will be set to the current date.
-- The value of "publish" will be set to false.
ls.add_snippets("markdown", {
  s("fm", {
    t("---"),
    t({ "", "title: '" }),
    -- Use a dynamic node for the title field
    d(1, function()
      local fname = get_filename()
      return sn(nil, { i(1, fname) }) -- Pre-fill with filename
    end),
    t("'"),
    t({ "", "date: " }),
    f(function()
      return os.date("%Y-%m-%d")
    end), -- Today's date
    t({ "", "publish: " }),
    i(2, "false"), -- Default to 'false', editable
    t({ "", "---", "" }),
    t("Tags: [["),
    i(0), -- Final jump target
    t("]]"),
  }),
})
