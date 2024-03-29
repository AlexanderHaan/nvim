local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l

-- Snippets

ls.add_snippets("all", {
	s("ternary", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	}),
    s("trigger", { t("Wow! Text!") })
})

-- LaTeX Snippets
ls.add_snippets("tex", {
    -- Acronym snippet
	s("ac", {
		t('\\ac{'), i(1), t('}'), i(0),
	}),
    
    -- Quotation snippet
	s("qt", {
		t('\\glqq '), i(1), t('\\grqq{}'), i(0),
	}),
    
    -- Reference snippet
	s("ref", {
		t('\\ref{'), i(1), t('}'), i(0),
	}),
    
    -- Italic snippet
	s("it", {
		t('\\textit{'), i(1), t('}'), i(0),
	}),

    -- Citation snippet
	s("cite", {
		t('\\cite{'), i(1), t('}'), i(0),
	}),
    
    -- Label snippet
	s("label", {
		t('\\label{'), i(1), t('}'), i(0),
	})
})
