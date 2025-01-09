local ls = require("luasnip")
local sn = ls.snippet_node
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node

-- Function to get the current filename without the directory or extension
local function file_name()
  local full_path = vim.fn.expand("%:t") -- Get the current file's name
  return full_path:gsub("%.%w+$", "")   -- Remove the extension
end

-- Dynamic node to set the title to the current file name
--local function dynamic_title(args, snip)
--  return sn(nil, {
--    i(1, file_name()), -- Default value is the file name, editable
--  })
--end

local function date_today()
  return os.date("%Y-%m-%d")
end

ls.add_snippets("markdown", {
  s("fm", {
    t("---"),
    t({ "", "title: '" }),
    d(1, function() -- Dynamic node to pre-fill the title with the filename
      return sn(nil, { i(1, file_name()) }) -- Default is the filename, editable
    end),
    t("'"),
    t({ "", "date: " }), f(date_today), -- Dynamically insert today's date
    t({ "", "publish: " }), i(2, "false"),
    t({ "", "---", "" }),
    t("Tags: [["), i(0), t("]]"),
  })
})
