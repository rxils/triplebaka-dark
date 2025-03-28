--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

local lush = require('lush')
local hsl = lush.hsl

local black = hsl(0, 0, 10)
local white = hsl(0, 0, 90)

local red = hsl(343, 73, 58)
local yellow = hsl(47, 100, 50)
local blue = hsl(176, 55, 50)

local gray_comment = hsl(0, 0, 30)
local gray_linenr = hsl(0, 0, 20)
local gray_float = hsl(0, 0, 15)

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    Normal         { bg = black, fg = white }, -- Normal text
    Comment        { fg = gray_comment }, -- Any comment
    -- NormalNC       { }, -- normal text in non-current windows
    Conceal        { Comment }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Title          { fg = Normal.fg, gui = 'bold' }, -- Titles for output from ":set all", ":autocmd" etc.
    Whitespace     { Comment }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    NonText        { Comment }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

    CursorLine     { bg = Normal.bg.lighten(10) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn   { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    ColorColumn    { bg = Normal.bg.lighten(2.5) }, -- Columns set with 'colorcolumn'

    LineNr         { fg = gray_linenr }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove    { LineNr }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow    { LineNr }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { fg = Normal.fg, gui = 'bold' }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineFold { LineNr }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    CursorLineSign { LineNr }, -- Like SignColumn when 'cursorline' is set for the cursor line
    EndOfBuffer    { LineNr }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.

    Cursor         { bg = blue, fg = black }, -- Character under the cursor
    TermCursor     { Cursor }, -- Cursor in a focused terminal
    TermCursorNC   { bg = gray_comment, fg = black }, -- Cursor in an unfocused terminal
    lCursor        { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|

    CurSearch      { bg = red, fg = black, gui = 'bold italic' }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Search         { bg = yellow, fg = black, gui = 'italic' }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    Visual         { bg = blue, fg = black }, -- Visual mode selection
    VisualNOS      { bg = Normal.fg, fg = Normal.bg }, -- Visual mode selection when vim is "Not Owning the Selection".
    MatchParen     { bg = Normal.fg, fg = Normal.bg, gui = 'italic' }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

    NormalFloat    { bg = gray_float, fg = Normal.fg }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    FloatTitle     { Title }, -- Title of floating windows.
    Pmenu          { bg = gray_float, fg = Normal.fg }, -- Popup menu: Normal item.
    PmenuSel       { bg = blue, fg = black }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar      { }, -- Popup menu: Scrollbar.
    PmenuThumb     { bg = gray_linenr, fg = gray_linenr }, -- Popup menu: Thumb of the scrollbar.

    StatusLine     { bg = gray_float, fg = Normal.fg }, -- Status line of current window
    StatusLineNC   { bg = gray_float, fg = Comment.fg }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine        { bg = gray_float, fg = Normal.fg }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    TabLineSel     { Normal, gui = 'bold' }, -- Tab pages line, active tab page label
    WinBar         { Normal }, -- Window bar of current window
    WinBarNC       { Normal }, -- Window bar of not-current windows

    ModeMsg        { fg = red }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        { fg = blue }, -- |more-prompt|
    Question       { fg = blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine   { fg = blue }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    WildMenu       { bg = blue, fg = black }, -- Current match in 'wildmenu' completion

    Winseparator   { fg = Normal.fg }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- VertSplit      { }, -- Column separating vertically split windows

    Folded         { LineNr }, -- Line used for closed folds
    FoldColumn     { LineNr }, -- 'foldcolumn'
    SignColumn     { LineNr }, -- Column where |signs| are displayed

    SpecialKey     { fg = Normal.fg, gui = 'italic underline' }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad       { SpecialKey }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap       { SpecialKey }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal     { SpecialKey }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare      { SpecialKey }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.

    Directory      { fg = blue }, -- Directory names (and other special names in listings)

    DiffAdd        { bg = blue, fg = black, gui = 'italic' }, -- Diff mode: Added line |diff.txt|
    DiffChange     { fg = yellow, gui = 'italic' }, -- Diff mode: Changed line |diff.txt|
    DiffDelete     { fg = red, gui = 'italic' }, -- Diff mode: Deleted line |diff.txt|
    DiffText       { bg = yellow, fg = black, gui = 'italic' }, -- Diff mode: Changed text within a changed line |diff.txt|

    WarningMsg     { fg = yellow, gui = 'bold' }, -- Warning messages
    ErrorMsg       { fg = red, gui = 'bold' }, -- Error messages on the command line

    RedrawDebugClear { bg = yellow, fg = black },
    RedrawDebugComposed { bg = blue, fg = black },
    RedrawDebugRecompose { bg = red, fg = black },
    NvimInternalError { bg = red, fg = red },




    Constant       { fg = yellow }, -- (*) Any constant
    String         { Constant }, --   A string constant: "this is a string"
    -- Character      { }, --   A character constant: 'c', '\n'
    -- Number         { }, --   A number constant: 234, 0xff
    -- Boolean        { }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier     { fg = blue }, -- (*) Any variable name
    Function       { Identifier }, --   Function name (also: methods for classes)

    Statement      { fg = red }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    Operator       { fg = red }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc        { fg = red }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = blue, gui = 'bold' }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { fg = blue }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined     { fg = Normal.fg, gui = 'underline' }, -- Text that stands out, HTML links
    Ignore         { fg = Normal.fg }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { ErrorMsg }, -- Any erroneous construct
    Todo           { fg = Normal.fg, gui = 'bold' }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX




    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    DiagnosticError            { fg = red, gui = 'bold' } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = yellow, gui = 'bold' } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = blue, gui = 'italic' } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = blue, gui = 'italic' } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk               { fg = Normal.fg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError   { DiagnosticError, gui = 'bold italic underline' } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { DiagnosticWarn, gui = 'bold italic underline' } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { DiagnosticInfo, gui = 'italic underline' } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { DiagnosticHint, gui = 'italic underline' } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk      { DiagnosticOk, gui = 'italic underline' } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    sym"@variable"          { fg = Normal.fg }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
