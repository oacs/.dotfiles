local ls = require("luasnip")
local s, i, t, c, sn, r = ls.s, ls.insert_node, ls.text_node, ls.choice_node, ls.snippet_node, ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt

-- local isn = ls.indent_snippet_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local r =
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

-- Test test snippet
return {
	s(
		"log",
		fmt(
			"console.log({{ {} }});",
			c(1, {
				sn(nil, {
					r(1, "value"),
					t(","),
				}),
				sn(nil, {
					i(0, "test"),
					t(":"),
					r(1, "value"),
					t(","),
				}),
			})
		)
	),
	s(
		"class",
		fmt(
			[[
      {} class {} {{ 
  {} 
  }} ]],
			{
				c(1, {
					i(nil, "export"),
					t(nil, ""),
				}),
				i(2, "ClassName"),
				c(3, {
					fmt(
						[[ 
          constructor({}) {{
            {}
          }}
        ]],
						{
							i(1, "service: Service"),
							i(2, "// do something"),
						}
					),
				}),
			}
		)
	),
}
-- ttt
