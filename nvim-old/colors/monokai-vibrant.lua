vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "monokai-vibrant"

local c = {
  bg        = "#16171D",
  bg_dark   = "#191B20",
  bg_light  = "#1F2328",
  bg_menu   = "#21252B",
  bg_sel    = "#2c313a",
  bg_visual = "#3E4451",
  fg        = "#f8f8f0",
  fg_dim    = "#D7DAE0",
  fg_dark   = "#9da5b4",
  comment   = "#5c6370",
  line_nr   = "#495162",
  guide     = "#3B4048",
  border    = "#3B3C40",
  red       = "#FF3F4F",
  green     = "#81F900",
  yellow    = "#FFD945",
  orange    = "#FF9700",
  pink      = "#E373CE",
  magenta   = "#E542FF",
  cyan      = "#19D1E5",
  blue      = "#00a0e4",
  teal      = "#56b6c2",
  white     = "#F6F6F6",
  error     = "#c24038",
  none      = "NONE",
}

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hi("Normal",       { fg = c.fg, bg = c.bg })
hi("NormalFloat",  { fg = c.fg, bg = c.bg_menu })
hi("FloatBorder",  { fg = c.border, bg = c.bg_menu })
hi("Cursor",       { fg = c.bg, bg = c.fg })
hi("CursorLine",   { bg = c.bg_light })
hi("CursorColumn", { bg = c.bg_light })
hi("ColorColumn",  { bg = c.bg_light })
hi("LineNr",       { fg = c.line_nr })
hi("CursorLineNr", { fg = c.yellow, bold = true })
hi("SignColumn",   { fg = c.fg, bg = c.bg })
hi("VertSplit",    { fg = c.border })
hi("WinSeparator", { fg = c.border })
hi("StatusLine",   { fg = c.white, bg = c.bg_dark })
hi("StatusLineNC", { fg = c.comment, bg = c.bg_dark })
hi("TabLine",      { fg = c.fg_dark, bg = c.bg_menu })
hi("TabLineFill",  { bg = c.bg_menu })
hi("TabLineSel",   { fg = c.fg, bg = c.bg_sel })
hi("Pmenu",        { fg = c.fg, bg = c.bg_menu })
hi("PmenuSel",     { bg = c.bg_sel })
hi("PmenuSbar",    { bg = c.bg_menu })
hi("PmenuThumb",   { bg = c.bg_visual })
hi("WildMenu",     { fg = c.fg, bg = c.bg_sel })
hi("Folded",       { fg = c.comment, bg = c.bg_light })
hi("FoldColumn",   { fg = c.comment, bg = c.bg })
hi("NonText",      { fg = c.guide })
hi("SpecialKey",   { fg = c.guide })
hi("Whitespace",   { fg = c.guide })
hi("Visual",       { bg = c.bg_visual })
hi("VisualNOS",    { bg = c.bg_visual })
hi("Search",       { fg = c.bg, bg = c.yellow })
hi("IncSearch",    { fg = c.bg, bg = c.orange })
hi("CurSearch",    { fg = c.bg, bg = c.orange })
hi("Substitute",   { fg = c.bg, bg = c.orange })
hi("MatchParen",   { fg = c.yellow, bold = true, underline = true })
hi("ModeMsg",      { fg = c.green })
hi("MoreMsg",      { fg = c.green })
hi("Question",     { fg = c.green })
hi("WarningMsg",   { fg = c.orange })
hi("ErrorMsg",     { fg = c.error })
hi("Error",        { fg = c.error })
hi("Title",        { fg = c.red, bold = true })
hi("Directory",    { fg = c.blue })
hi("Conceal",      { fg = c.comment })
hi("EndOfBuffer",  { fg = c.bg })
hi("IndentBlanklineChar", { fg = c.guide })

-- Syntax
hi("Comment",     { fg = c.comment, italic = true })
hi("Constant",    { fg = c.pink })
hi("String",      { fg = c.yellow })
hi("Character",   { fg = c.yellow })
hi("Number",      { fg = c.pink })
hi("Boolean",     { fg = c.pink })
hi("Float",       { fg = c.pink })
hi("Identifier",  { fg = c.fg })
hi("Function",    { fg = c.green })
hi("Statement",   { fg = c.red })
hi("Conditional", { fg = c.red })
hi("Repeat",      { fg = c.red })
hi("Label",       { fg = c.red })
hi("Operator",    { fg = c.red })
hi("Keyword",     { fg = c.red })
hi("Exception",   { fg = c.red })
hi("PreProc",     { fg = c.red })
hi("Include",     { fg = c.red })
hi("Define",      { fg = c.red })
hi("Macro",       { fg = c.red })
hi("PreCondit",   { fg = c.red })
hi("Type",        { fg = c.cyan })
hi("StorageClass",  { fg = c.red, italic = true })
hi("Structure",   { fg = c.cyan })
hi("Typedef",     { fg = c.cyan })
hi("Special",     { fg = c.orange })
hi("SpecialChar", { fg = c.orange })
hi("Tag",         { fg = c.red })
hi("Delimiter",   { fg = c.fg })
hi("SpecialComment", { fg = c.comment, italic = true })
hi("Debug",       { fg = c.orange })
hi("Underlined",  { underline = true })
hi("Ignore",      {})
hi("Todo",        { fg = c.yellow, bold = true })

-- Treesitter
hi("@comment",              { link = "Comment" })
hi("@string",               { fg = c.yellow })
hi("@string.escape",        { fg = c.orange })
hi("@string.regex",         { fg = c.orange })
hi("@string.special",       { fg = c.orange })
hi("@character",            { fg = c.yellow })
hi("@number",               { fg = c.pink })
hi("@boolean",              { fg = c.pink })
hi("@float",                { fg = c.pink })
hi("@function",             { fg = c.green })
hi("@function.builtin",     { fg = c.cyan })
hi("@function.call",        { fg = c.green })
hi("@function.macro",       { fg = c.green })
hi("@method",               { fg = c.green })
hi("@method.call",          { fg = c.green })
hi("@constructor",          { fg = c.cyan })
hi("@parameter",            { fg = c.orange, italic = true })
hi("@keyword",              { fg = c.red })
hi("@keyword.function",     { fg = c.cyan })
hi("@keyword.operator",     { fg = c.red })
hi("@keyword.return",       { fg = c.red })
hi("@conditional",          { fg = c.red })
hi("@repeat",               { fg = c.red })
hi("@label",                { fg = c.red })
hi("@include",              { fg = c.red })
hi("@exception",            { fg = c.red })
hi("@operator",             { fg = c.red })
hi("@punctuation.bracket",  { fg = c.fg })
hi("@punctuation.delimiter",{ fg = c.fg })
hi("@punctuation.special",  { fg = c.red })
hi("@type",                 { fg = c.cyan })
hi("@type.builtin",         { fg = c.cyan })
hi("@type.definition",      { fg = c.cyan })
hi("@type.qualifier",       { fg = c.red })
hi("@storageclass",         { fg = c.red, italic = true })
hi("@namespace",            { fg = c.blue })
hi("@field",                { fg = c.fg })
hi("@property",             { fg = c.fg })
hi("@variable",             { fg = c.fg })
hi("@variable.builtin",     { fg = c.red, italic = true })
hi("@constant",             { fg = c.pink })
hi("@constant.builtin",     { fg = c.pink })
hi("@constant.macro",       { fg = c.pink })
hi("@text",                 { fg = c.fg })
hi("@text.strong",          { bold = true })
hi("@text.emphasis",        { italic = true })
hi("@text.underline",       { underline = true })
hi("@text.title",           { fg = c.red, bold = true })
hi("@text.literal",         { fg = c.teal })
hi("@text.uri",             { fg = c.blue, underline = true })
hi("@text.todo",            { fg = c.yellow, bold = true })
hi("@text.note",            { fg = c.cyan, bold = true })
hi("@text.warning",         { fg = c.orange, bold = true })
hi("@text.danger",          { fg = c.error, bold = true })
hi("@tag",                  { fg = c.red })
hi("@tag.attribute",        { fg = c.green })
hi("@tag.delimiter",        { fg = c.fg })

-- LSP Semantic Tokens
hi("@lsp.type.class",         { fg = c.blue })
hi("@lsp.type.decorator",     { fg = c.green })
hi("@lsp.type.enum",          { fg = c.cyan })
hi("@lsp.type.enumMember",    { fg = c.pink })
hi("@lsp.type.function",      { fg = c.green })
hi("@lsp.type.interface",     { fg = c.cyan })
hi("@lsp.type.macro",         { fg = c.green })
hi("@lsp.type.method",        { fg = c.green })
hi("@lsp.type.namespace",     { fg = c.blue })
hi("@lsp.type.parameter",     { fg = c.orange, italic = true })
hi("@lsp.type.property",      { fg = c.fg })
hi("@lsp.type.struct",        { fg = c.cyan })
hi("@lsp.type.type",          { fg = c.cyan })
hi("@lsp.type.typeParameter", { fg = c.cyan })
hi("@lsp.type.variable",      { fg = c.fg })

-- Diagnostics
hi("DiagnosticError",          { fg = c.error })
hi("DiagnosticWarn",           { fg = c.orange })
hi("DiagnosticInfo",           { fg = c.blue })
hi("DiagnosticHint",           { fg = c.teal })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.error })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.orange })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.teal })
hi("DiagnosticVirtualTextError", { fg = c.error, bg = "#2a1c1b" })
hi("DiagnosticVirtualTextWarn",  { fg = c.orange, bg = "#2a2518" })
hi("DiagnosticVirtualTextInfo",  { fg = c.blue, bg = "#1a2230" })
hi("DiagnosticVirtualTextHint",  { fg = c.teal, bg = "#1a2a2a" })

-- Git signs
hi("GitSignsAdd",    { fg = c.green })
hi("GitSignsChange", { fg = c.orange })
hi("GitSignsDelete", { fg = c.red })

-- Diff
hi("DiffAdd",    { bg = "#1a2e1a" })
hi("DiffChange", { bg = "#2a2518" })
hi("DiffDelete", { fg = c.red, bg = "#2a1c1b" })
hi("DiffText",   { bg = "#3a3518" })

-- Telescope
hi("TelescopeNormal",       { fg = c.fg, bg = c.bg_dark })
hi("TelescopeBorder",       { fg = c.border, bg = c.bg_dark })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg_light })
hi("TelescopePromptBorder", { fg = c.bg_light, bg = c.bg_light })
hi("TelescopePromptTitle",  { fg = c.bg, bg = c.red })
hi("TelescopePreviewTitle", { fg = c.bg, bg = c.green })
hi("TelescopeResultsTitle", { fg = c.bg, bg = c.blue })
hi("TelescopeSelection",    { bg = c.bg_sel })
hi("TelescopeMatching",     { fg = c.yellow, bold = true })

-- nvim-cmp
hi("CmpItemAbbr",           { fg = c.fg })
hi("CmpItemAbbrMatch",      { fg = c.yellow, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = c.yellow, bold = true })
hi("CmpItemKindFunction",   { fg = c.green })
hi("CmpItemKindMethod",     { fg = c.green })
hi("CmpItemKindVariable",   { fg = c.blue })
hi("CmpItemKindKeyword",    { fg = c.red })
hi("CmpItemKindText",       { fg = c.fg })
hi("CmpItemKindClass",      { fg = c.cyan })
hi("CmpItemKindInterface",  { fg = c.cyan })
hi("CmpItemKindStruct",     { fg = c.cyan })
hi("CmpItemKindProperty",   { fg = c.fg })
hi("CmpItemKindField",      { fg = c.fg })
hi("CmpItemKindEnum",       { fg = c.cyan })
hi("CmpItemKindSnippet",    { fg = c.orange })
hi("CmpItemKindConstant",   { fg = c.pink })
hi("CmpItemKindModule",     { fg = c.blue })

-- Indent Blankline
hi("IblIndent", { fg = c.guide })
hi("IblScope",  { fg = c.comment })

-- Which Key
hi("WhichKey",          { fg = c.red })
hi("WhichKeyGroup",     { fg = c.cyan })
hi("WhichKeyDesc",      { fg = c.fg_dim })
hi("WhichKeySeparator", { fg = c.comment })
hi("WhichKeyFloat",     { bg = c.bg_dark })

-- Lazy
hi("LazyH1",          { fg = c.bg, bg = c.blue, bold = true })
hi("LazyButton",      { fg = c.fg, bg = c.bg_sel })
hi("LazyButtonActive", { fg = c.bg, bg = c.blue })
hi("LazySpecial",     { fg = c.cyan })

-- Trouble
hi("TroubleNormal",  { fg = c.fg, bg = c.bg_dark })
hi("TroubleCount",   { fg = c.pink, bg = c.bg_sel })
hi("TroubleText",    { fg = c.fg })

-- Markdown
hi("markdownH1",          { fg = c.red, bold = true })
hi("markdownH2",          { fg = c.red, bold = true })
hi("markdownH3",          { fg = c.red, bold = true })
hi("markdownH4",          { fg = c.red, bold = true })
hi("markdownCode",        { fg = c.teal })
hi("markdownCodeBlock",   { fg = c.teal })
hi("markdownUrl",         { fg = c.blue, underline = true })
hi("markdownLinkText",    { fg = c.blue })
hi("markdownBold",        { bold = true })
hi("markdownItalic",      { italic = true })
hi("markdownBlockquote",  { fg = c.green })
hi("markdownListMarker",  { fg = c.white, bold = true })
