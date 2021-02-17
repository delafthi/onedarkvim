syntax reset
let g:colors_name = 'onedark'

" Dark color scheme {{{1
let s:red          = ['#e06c75', '4']
let s:green        = ['#98c379', '2']
let s:orange       = ['#e59F70', '130']
let s:yellow       = ['#e5c07b', '6']
let s:blue         = ['#61afef', '1']
let s:purple       = ['#c678dd', '5']
let s:cyan         = ['#56b6c2', '3']

let s:red_dark     = ['#be646a', '88']
let s:green_dark   = ['#7e9d69', '22']
let s:orange_dark  = ['#c08768', '130']
let s:yellow_dark  = ['#bd9e6f', '136']
let s:blue_dark    = ['#5f96c9', '62']
let s:purple_dark  = ['#a86cbb', '97']
let s:cyan_dark    = ['#51969f', '66']

let s:red_light    = ['#e8838c', '12']
let s:green_light  = ['#a6d18c', '10']
let s:orange_light = ['#ecb07e', '173']
let s:yellow_light = ['#eccd84', '14']
let s:blue_light   = ['#75c2f3', '9']
let s:purple_light = ['#d38de6', '13']
let s:cyan_light   = ['#69c7d1', '11']

let s:black        = ['#282c34', '0']
let s:white        = ['#dcdfe4', '15']

let s:mono0        = ['#313640', '235']
let s:mono1        = ['#343944', '236']
let s:mono2        = ['#373d49', '237']
let s:mono3        = ['#4b5263', '59']
let s:mono4        = ['#5c6370', '59']
let s:mono5        = ['#919baa', '245']
let s:mono6        = ['#abb2bf', '145']

let s:none = ''

" Set terminal colors {{{1
" Fix colors in neovim terminal buffers {
if has('nvim')
  let g:terminal_color_0 = s:black[0]
  let g:terminal_color_1 = s:red_dark[0]
  let g:terminal_color_2 = s:green_dark[0]
  let g:terminal_color_3 = s:yellow_dark[0]
  let g:terminal_color_4 = s:blue_dark[0]
  let g:terminal_color_5 = s:purple_dark[0]
  let g:terminal_color_6 = s:cyan_dark[0]
  let g:terminal_color_7 = s:black[0]
  let g:terminal_color_8 = s:mono0[0]
  let g:terminal_color_9 = s:red[0]
  let g:terminal_color_10 = s:green[0]
  let g:terminal_color_11 = s:yellow[0]
  let g:terminal_color_12 = s:blue[0]
  let g:terminal_color_13 = s:purple[0]
  let g:terminal_color_14 = s:cyan[0]
  let g:terminal_color_15 = s:white[0]
  let g:terminal_color_background = s:black[0]
  let g:terminal_color_foreground = s:white[0]
endif

" Helper functions {{{1
" From rakr/vim-one
function! <Sid>X(group, fg, bg, attr, ...)
  let l:attrsp = get(a:, 1, "")
  " fg, bg, attr, attrsp
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" .  a:fg[0]
    exec "hi " . a:group . " ctermfg=" . a:fg[1]
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" .  a:bg[0]
    exec "hi " . a:group . " ctermbg=" . a:bg[1]
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" .   a:attr
    exec "hi " . a:group . " cterm=" . a:attr
  endif
  if !empty(l:attrsp)
    exec "hi " . a:group . " guisp=" . l:attrsp[0]
  endif
endfunction

" Highlighting Groups (descriptions and ordering from `:h highlight-groups`) {{{1

call <Sid>X('ColorColumn'  , s:none         , s:mono0   , 'none')         " used for the columns set with 'colorcolumn'
call <Sid>X('Conceal'      , s:none         , s:none    , 'none')         " placeholder characters substituted for concealed text (see 'conceallevel')
call <Sid>X('Cursor'       , s:white        , s:none    , 'bold,reverse') " the character under the cursor
call <Sid>X('lCursor'      , s:white        , s:none    , 'bold,reverse') " the character under the crusor when language-mapping is used (see 'guicursor')
call <Sid>X('CursorIM'     , s:none         , s:none    , 'none')         " like Cursor, but used when in IME mode
call <Sid>X('CursorColumn' , s:none         , s:none    , 'bold,reverse') " Screen-column at the  cursor, when 'cursorcolumn' is set.
call <Sid>X('CursorLine'   , s:none         , s:mono0   , 'none')         " Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guigf) is not set.
call <Sid>X('Directory'    , s:blue         , s:none    , 'bold')         " directory names (and other special names in listings)
call <Sid>X('DiffAdd'      , s:green        , s:none    , 'reverse')      " diff mode: Added line
call <Sid>X('DiffChange'   , s:yellow       , s:none    , 'reverse')      " diff mode: Changed line
call <Sid>X('DiffDelete'   , s:red          , s:none    , 'reverse')      " diff mode: Deleted line
call <Sid>X('DiffText'     , s:yellow       , s:none    , 'reverse')      " diff mode: Changed text within a changed line
call <Sid>X('EndOfBuffer'  , s:mono0        , s:none    , 'none')         " filler lines (~) after the last line in the buffer
call <Sid>X('TermCursor'   , s:white        , s:none    , 'bold,reverse') " cursor in a focused terminal
call <Sid>X('TermCursorNC' , s:mono3        , s:none    , 'bold,reverse') " cursor in an unfocused terminal
call <Sid>X('ErrorMsg'     , s:red          , s:none    , 'none')         " error messages on the command line
call <Sid>X('VertSplit'    , s:mono0        , s:none    , 'bold')         " the column separating vertically split windows
call <Sid>X('Folded'       , s:none         , s:mono3   , 'bold')         " line used for closed folds
call <Sid>X('FoldColumn'   , s:none         , s:mono3   , 'none')         " 'foldcolumn'
call <Sid>X('SignColumn'   , s:white        , s:black   , 'none')          " column where signs are displayed
call <Sid>X('IncSearch'    , s:yellow_dark  , s:none    , 'bold,reverse') " 'incsearch' highlighting; also used for the text replaced with ':s///c'
call <Sid>X('Substitute'   , s:yellow_dark  , s:none    , 'bold,reverse') " :substitute replacement text highlighting
call <Sid>X('LineNr'       , s:mono3        , s:black    , 'none')         " Line number for':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.
call <Sid>X('CursorLineNr' , s:blue         , s:none    , 'bold')         " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
call <Sid>X('MatchParen'   , s:blue         , s:none    , 'underline')    " The character under the cursor or just before it, if it is a paired bracket, and its match.
call <Sid>X('ModeMsg'      , s:none         , s:none    , 'none')         " 'showmode' message (eg.,'INSERT')
call <Sid>X('MsgArea'      , s:none         , s:none    , 'none')         " Area for messages and cmdline
call <Sid>X('MsgSeparator' , s:none         , s:none    , 'none')         " Separator for scrolled messages, msgsep flag of 'display'
call <Sid>X('MoreMsg'      , s:none         , s:none    , 'none')         " more-prompt
call <Sid>X('NonText'      , s:mono4        , s:none    , 'none')         " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g. , '>' displayed when a double-wide character doesn't fit at the end of the line).
call <Sid>X('Normal'       , s:white        , s:none    , 'none')         " normal text
call <Sid>X('NormalFloat'  , s:white        , s:none    , 'none')         " normal text in floating windows
call <Sid>X('NormalNC'     , s:white        , s:none    , 'none')         " normal text in non-current windows
call <Sid>X('Pmenu'        , s:white        , s:mono1   , 'none')         " Popup menu: normal item.
call <Sid>X('PmenuSel'     , s:black        , s:blue    , 'bold')         " Popup menu: selected item.
call <Sid>X('PmenuSbar'    , s:none         , s:mono2   , 'none')         " Popup menu: scrollbar.
call <Sid>X('PmenuThumb'   , s:none         , s:mono3   , 'none')         " Popup menu: Thumb of the scrollbar.
call <Sid>X('Question'     , s:purple       , s:none    , 'bold')         " hit-enter prompt and yes/no questions
call <Sid>X('QuickFixLine' , s:yellow       , s:none    , 'bold,reverse') " Current quickfix item in the quickfix window.
call <Sid>X('Search'       , s:yellow       , s:none    , 'bold,reverse') " Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
call <Sid>X('SpecialKey'   , s:mono4        , s:none    , 'none')         " Meta and special keys listed with ':map', also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call <Sid>X('SpellBad'     , s:red          , s:none    , 'undercurl')    " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call <Sid>X('SpellCap'     , s:yellow       , s:none    , 'none')         " Word that should start with a capital. This will be combined with the highlighting used otherwise.
call <Sid>X('SpellLocal'   , s:yellow_dark  , s:none    , 'none')         " Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call <Sid>X('SpellRare'    , s:yellow_light , s:none    , 'none')         " Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call <Sid>X('StatusLine'   , s:white        , s:mono0   , 'none')         " status line of current window
call <Sid>X('StatusLineNC' , s:mono0        , s:none    , 'bold')         " status lines of not-current windows Note: if this is equal to 'StatusLine' Vim will use '^^^' in the status line of the current window.
call <Sid>X('TabLine'      , s:mono4        , s:mono0   , 'none')         " tab  pages line, not active tap page label
call <Sid>X('TabLineFill'  , s:none         , s:mono0   , 'none')         " tab  pages line, where there are no labels
call <Sid>X('TabLineSel'   , s:white        , s:black   , 'none')         " tab  pages line, active tab page label
call <Sid>X('Title'        , s:green        , s:none    , 'bold')         " titles for output from ':set all', ':autocmd' etc.
call <Sid>X('Visual'       , s:black        , s:blue    , 'none')      " Visual mode selection
call <Sid>X('VisualNOS'    , s:black        , s:blue    , 'inverse')      " Visual mode selection when vim is 'Not Owning the Selection' . Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call <Sid>X('WarningMsg'   , s:yellow       , s:none    , 'none')         " warning messages                                  '
call <Sid>X('Whitespace'   , s:mono4        , s:none    , 'none')         " 'nbsp', 'space', ' tab ' and ' trail ' in 'listchars'
call <Sid>X('WildMenu'     , s:blue         , s:none    , 'bold,reverse') " current match in 'wildmenu' completion

" Syntax Groups (descriptions and ordering from `:h w18`) {{{1

call <Sid>X('Comment'        , s:mono4        , s:none , 'none')            " any comment

call <Sid>X('Constant'       , s:orange       , s:none , 'none')            " any constant
call <Sid>X('String'         , s:green        , s:none , 'none')            " this is a string
call <Sid>X('Character'      , s:green_light  , s:none , 'none')            " a character constant: 'c', '\n'
call <Sid>X('Number'         , s:yellow       , s:none , 'none')            " a boolean constant: TRUE, false
call <Sid>X('Boolean'        , s:orange       , s:none , 'none')            " a boolean constant: TRUE, false
call <Sid>X('Float'          , s:yellow_light , s:none , 'none')            " a floating point constant: 2.3e10

call <Sid>X('Identifier'     , s:red          , s:none , 'none')            " any variable name
call <Sid>X('Function'       , s:blue         , s:none , 'bold')            " function name (also: methods for classes)

call <Sid>X('Statement'      , s:purple       , s:none , 'italic')          " any statement
call <Sid>X('Conditional'    , s:purple       , s:none , 'italic')          " if, then, else, endif, switch, etc.
call <Sid>X('Repeat'         , s:purple       , s:none , 'italic')          " for, do, while, etc.
call <Sid>X('Label'          , s:purple       , s:none , 'italic')          " case, default, etc.
call <Sid>X('Operator'       , s:cyan         , s:none , 'none')            " sizeof ' , ' + ' , ' * ' , etc.
call <Sid>X('Keyword'        , s:red          , s:none , 'italic')          " any other keyword
call <Sid>X('Exception'      , s:red_light    , s:none , 'italic')          " try, catch, throw

call <Sid>X('PreProc'        , s:yellow       , s:none , 'none')            " generic Preprocessor
call <Sid>X('Include'        , s:blue         , s:none , 'none')            " preprocessor #include
call <Sid>X('Define'         , s:purple       , s:none , 'none')            " preprocessor #define
call <Sid>X('Macro'          , s:purple       , s:none , 'bold')            " same as Define
call <Sid>X('PreCondit'      , s:yellow       , s:none , 'none')            " preprocessor #if, #else, #endif, etc.

call <Sid>X('Type'           , s:yellow       , s:none , 'none')            " int, long, char, etc.
call <Sid>X('StorageClass'   , s:yellow       , s:none , 'bold')            " static, register, volatile, etc.
call <Sid>X('Structure'      , s:yellow       , s:none , 'bold')            " struct, union, enum, etc.
call <Sid>X('Typedef'        , s:yellow       , s:none , 'none')            " A typedef

call <Sid>X('Special'        , s:blue         , s:none , 'italic')          " any special symbol
call <Sid>X('SpecialChar'    , s:none         , s:none , 'bold')            " special character in a constant
call <Sid>X('Tag'            , s:none         , s:none , 'none')            " you can use CTRL-] on this
call <Sid>X('Delimiter'      , s:white        , s:none , 'none')            " character that needs attention
call <Sid>X('SpecialComment' , s:mono5        , s:none , 'none')            " special things inside a comment
call <Sid>X('Debug'          , s:none         , s:none , 'bold')            " debugging statements

call <Sid>X('Underlined'     , s:blue         , s:none , 'underline')       " text that stands out, HTML links

call <Sid>X('Ignore'         , s:none         , s:none , 'none')            " left blank, hidden

call <Sid>X('Error'          , s:red          , s:none , 'none')            " any erroneous construct

call <Sid>X('Todo'           , s:purple       , s:none , 'bold,reverse') " anything that needs extra attention; mostly the keywords TODO FIXME and XXX

" Language-Specific Highlighting {{{1

" Asciidoc
call <Sid>X('asciidocListingBlock' , s:mono5 , s:none , 'none')

" C/C++ highlighting
call <Sid>X('cInclude'          , s:purple , s:none , 'none')
call <Sid>X('cPreCondit'        , s:purple , s:none , 'none')
call <Sid>X('cPreConditMatch'   , s:purple , s:none , 'none')
call <Sid>X('cType'             , s:purple , s:none , 'none')
call <Sid>X('cStorageClass'     , s:purple , s:none , 'none')
call <Sid>X('cStructure'        , s:purple , s:none , 'none')
call <Sid>X('cOperator'         , s:purple , s:none , 'none')
call <Sid>X('cStatement'        , s:purple , s:none , 'none')
call <Sid>X('cTODO'             , s:purple , s:none , 'none')
call <Sid>X('cConstant'         , s:orange , s:none , 'none')
call <Sid>X('cSpecial'          , s:cyan   , s:none , 'none')
call <Sid>X('cSpecialCharacter' , s:cyan   , s:none , 'none')
call <Sid>X('cString'           , s:green  , s:none , 'none')
call <Sid>X('cppType'           , s:purple , s:none , 'none')
call <Sid>X('cppStorageClass'   , s:purple , s:none , 'none')
call <Sid>X('cppStructure'      , s:purple , s:none , 'none')
call <Sid>X('cppModifier'       , s:purple , s:none , 'none')
call <Sid>X('cppOperator'       , s:purple , s:none , 'none')
call <Sid>X('cppAccess'         , s:purple , s:none , 'none')
call <Sid>X('cppStatement'      , s:purple , s:none , 'none')
call <Sid>X('cppConstant'       , s:red    , s:none , 'none')
call <Sid>X('cCppString'        , s:green  , s:none , 'none')

" Cucumber
call <Sid>X('cucumberGiven'           , s:blue   , s:none , 'none')
call <Sid>X('cucumberWhen'            , s:blue   , s:none , 'none')
call <Sid>X('cucumberWhenAnd'         , s:blue   , s:none , 'none')
call <Sid>X('cucumberThen'            , s:blue   , s:none , 'none')
call <Sid>X('cucumberThenAnd'         , s:blue   , s:none , 'none')
call <Sid>X('cucumberUnparsed'        , s:orange , s:none , 'none')
call <Sid>X('cucumberFeature'         , s:red    , s:none , 'bold')
call <Sid>X('cucumberBackground'      , s:purple , s:none , 'bold')
call <Sid>X('cucumberScenario'        , s:purple , s:none , 'bold')
call <Sid>X('cucumberScenarioOutline' , s:purple , s:none , 'bold')
call <Sid>X('cucumberTags'            , s:mono4  , s:none , 'bold')
call <Sid>X('cucumberDelimiter'       , s:mono4  , s:none , 'bold')

" CSS/Sass
call <Sid>X('cssAttrComma'         , s:purple , s:none , 'none')
call <Sid>X('cssAttributeSelector' , s:green  , s:none , 'none')
call <Sid>X('cssBraces'            , s:mono5  , s:none , 'none')
call <Sid>X('cssClassName'         , s:orange , s:none , 'none')
call <Sid>X('cssClassNameDot'      , s:orange , s:none , 'none')
call <Sid>X('cssDefinition'        , s:purple , s:none , 'none')
call <Sid>X('cssFontAttr'          , s:orange , s:none , 'none')
call <Sid>X('cssFontDescriptor'    , s:purple , s:none , 'none')
call <Sid>X('cssFunctionName'      , s:blue   , s:none , 'none')
call <Sid>X('cssIdentifier'        , s:blue   , s:none , 'none')
call <Sid>X('cssImportant'         , s:purple , s:none , 'none')
call <Sid>X('cssInclude'           , s:white  , s:none , 'none')
call <Sid>X('cssIncludeKeyword'    , s:purple , s:none , 'none')
call <Sid>X('cssMediaType'         , s:orange , s:none , 'none')
call <Sid>X('cssProp'              , s:cyan   , s:none , 'none')
call <Sid>X('cssPseudoClassId'     , s:orange , s:none , 'none')
call <Sid>X('cssSelectorOp'        , s:purple , s:none , 'none')
call <Sid>X('cssSelectorOp2'       , s:purple , s:none , 'none')
call <Sid>X('cssStringQ'           , s:green  , s:none , 'none')
call <Sid>X('cssStringQQ'          , s:green  , s:none , 'none')
call <Sid>X('cssTagName'           , s:red    , s:none , 'none')
call <Sid>X('cssAttr'              , s:orange , s:none , 'none')
call <Sid>X('sassAmpersand'        , s:red    , s:none , 'none')
call <Sid>X('sassClass'            , s:yellow , s:none , 'none')
call <Sid>X('sassControl'          , s:purple , s:none , 'none')
call <Sid>X('sassExtend'           , s:purple , s:none , 'none')
call <Sid>X('sassFor'              , s:white  , s:none , 'none')
call <Sid>X('sassProperty'         , s:cyan   , s:none , 'none')
call <Sid>X('sassFunction'         , s:cyan   , s:none , 'none')
call <Sid>X('sassId'               , s:blue   , s:none , 'none')
call <Sid>X('sassInclude'          , s:purple , s:none , 'none')
call <Sid>X('sassMedia'            , s:purple , s:none , 'none')
call <Sid>X('sassMediaOperators'   , s:white  , s:none , 'none')
call <Sid>X('sassMixin'            , s:purple , s:none , 'none')
call <Sid>X('sassMixinName'        , s:blue   , s:none , 'none')
call <Sid>X('sassMixing'           , s:purple , s:none , 'none')
call <Sid>X('scssSelectorName'     , s:yellow , s:none , 'none')

" Elixir highlighting

call <Sid>X('elixirModuleDefine'      , s:purple , s:none   , 'none')
call <Sid>X('elixirAlias'             , s:yellow , s:none   , 'none')
call <Sid>X('elixirAtom'              , s:cyan   , s:none   , 'none')
call <Sid>X('elixirBlockDefinition'   , s:purple , s:none   , 'none')
call <Sid>X('elixirModuleDeclaration' , s:orange , s:none   , 'none')
call <Sid>X('elixirInclude'           , s:red    , s:none   , 'none')
call <Sid>X('elixirOperator'          , s:orange , s:none   , 'none')

" Git and git related plugins
call <Sid>X('gitcommitComment'        , s:mono4  , s:none , 'none')
call <Sid>X('gitcommitUnmerged'       , s:green  , s:none , 'none')
call <Sid>X('gitcommitOnBranch'       , s:none   , s:none , 'none')
call <Sid>X('gitcommitBranch'         , s:purple , s:none , 'none')
call <Sid>X('gitcommitDiscardedType'  , s:red    , s:none , 'none')
call <Sid>X('gitcommitSelectedType'   , s:green  , s:none , 'none')
call <Sid>X('gitcommitHeader'         , s:none   , s:none , 'none')
call <Sid>X('gitcommitUntrackedFile'  , s:cyan   , s:none , 'none')
call <Sid>X('gitcommitDiscardedFile'  , s:red    , s:none , 'none')
call <Sid>X('gitcommitSelectedFile'   , s:green  , s:none , 'none')
call <Sid>X('gitcommitUnmergedFile'   , s:yellow , s:none , 'none')
call <Sid>X('gitcommitFile'           , s:none   , s:none , 'none')
call <Sid>X('gitcommitNoBranch'       , s:purple , s:none , 'none')
call <Sid>X('gitcommitUntracked'      , s:mono4  , s:none , 'none')
call <Sid>X('gitcommitDiscarded'      , s:mono4  , s:none , 'none')
call <Sid>X('gitcommitDiscardedArrow' , s:red    , s:none , 'none')
call <Sid>X('gitcommitSelectedArrow'  , s:green  , s:none , 'none')
call <Sid>X('gitcommitUnmergedArrow'  , s:yellow , s:none , 'none')
call <Sid>X('SignifySignAdd'          , s:green  , s:none , 'none')
call <Sid>X('SignifySignChange'       , s:yellow , s:none , 'none')
call <Sid>X('SignifySignDelete'       , s:red    , s:none , 'none')
call <Sid>X('GitGutterAdd'            , s:green  , s:none , 'none')
call <Sid>X('GitGutterChange'         , s:yellow , s:none , 'none')
call <Sid>X('GitGutterDelete'         , s:red    , s:none , 'none')
call <Sid>X('diffAdded'               , s:green  , s:none , 'none')
call <Sid>X('diffRemoved'             , s:red    , s:none , 'none')

" Go
call <Sid>X('goDeclaration'  , s:purple , s:none , 'none')
call <Sid>X('goField'        , s:red    , s:none , 'none')
call <Sid>X('goMethod'       , s:cyan   , s:none , 'none')
call <Sid>X('goType'         , s:purple , s:none , 'none')
call <Sid>X('goUnsignedInts' , s:cyan   , s:none , 'none')

" Haskell highlighting
call <Sid>X('haskellDeclKeyword'    , s:blue   , s:none , 'none')
call <Sid>X('haskellType'           , s:green  , s:none , 'none')
call <Sid>X('haskellWhere'          , s:red    , s:none , 'none')
call <Sid>X('haskellImportKeywords' , s:blue   , s:none , 'none')
call <Sid>X('haskellOperators'      , s:red    , s:none , 'none')
call <Sid>X('haskellDelimiter'      , s:blue   , s:none , 'none')
call <Sid>X('haskellIdentifier'     , s:orange , s:none , 'none')
call <Sid>X('haskellKeyword'        , s:red    , s:none , 'none')
call <Sid>X('haskellNumber'         , s:cyan   , s:none , 'none')
call <Sid>X('haskellString'         , s:cyan   , s:none , 'none')

" HTML
call <Sid>X('htmlArg'            , s:orange , s:none  , 'none')
call <Sid>X('htmlTagName'        , s:red    , s:none  , 'none')
call <Sid>X('htmlTagN'           , s:red    , s:none  , 'none')
call <Sid>X('htmlSpecialTagName' , s:red    , s:none  , 'none')
call <Sid>X('htmlTag'            , s:mono5  , s:none  , 'none')
call <Sid>X('htmlEndTag'         , s:mono5  , s:none  , 'none')
call <Sid>X('MatchTag'           , s:red    , s:mono0 , 'bold,underline')

" JavaScript
call <Sid>X('coffeeString'                   , s:green    , s:none , 'none')
call <Sid>X('javaScriptBraces'               , s:mono5    , s:none , 'none')
call <Sid>X('javaScriptFunction'             , s:purple   , s:none , 'none')
call <Sid>X('javaScriptIdentifier'           , s:purple   , s:none , 'none')
call <Sid>X('javaScriptNull'                 , s:orange   , s:none , 'none')
call <Sid>X('javaScriptNumber'               , s:orange   , s:none , 'none')
call <Sid>X('javaScriptRequire'              , s:cyan     , s:none , 'none')
call <Sid>X('javaScriptReserved'             , s:purple   , s:none , 'none')
" httpc.//github.com/pangloss/vim-javascript
call <Sid>X('jsArrowFunction'                , s:purple   , s:none , 'none')
call <Sid>X('jsBraces'                       , s:mono5    , s:none , 'none')
call <Sid>X('jsClassBraces'                  , s:mono5    , s:none , 'none')
call <Sid>X('jsClassKeywords'                , s:purple   , s:none , 'none')
call <Sid>X('jsDocParam'                     , s:blue     , s:none , 'none')
call <Sid>X('jsDocTags'                      , s:purple   , s:none , 'none')
call <Sid>X('jsFuncBraces'                   , s:mono5    , s:none , 'none')
call <Sid>X('jsFuncCall'                     , s:blue     , s:none , 'none')
call <Sid>X('jsFuncParens'                   , s:mono5    , s:none , 'none')
call <Sid>X('jsFunction'                     , s:purple   , s:none , 'none')
call <Sid>X('jsGlobalObjects'                , s:yellow   , s:none , 'none')
call <Sid>X('jsModuleWords'                  , s:purple   , s:none , 'none')
call <Sid>X('jsModules'                      , s:purple   , s:none , 'none')
call <Sid>X('jsNoise'                        , s:mono5    , s:none , 'none')
call <Sid>X('jsNull'                         , s:orange   , s:none , 'none')
call <Sid>X('jsOperator'                     , s:purple   , s:none , 'none')
call <Sid>X('jsParens'                       , s:mono5    , s:none , 'none')
call <Sid>X('jsStorageClass'                 , s:purple   , s:none , 'none')
call <Sid>X('jsTemplateBraces'               , s:red_dark , s:none , 'none')
call <Sid>X('jsTemplateVar'                  , s:green    , s:none , 'none')
call <Sid>X('jsThis'                         , s:red      , s:none , 'none')
call <Sid>X('jsUndefined'                    , s:orange   , s:none , 'none')
call <Sid>X('jsObjectValue'                  , s:blue     , s:none , 'none')
call <Sid>X('jsObjectKey'                    , s:cyan     , s:none , 'none')
call <Sid>X('jsReturn'                       , s:purple   , s:none , 'none')
" httpc.//github.com/othree/yajs.vim
call <Sid>X('javascriptArrowFunc'            , s:purple   , s:none , 'none')
call <Sid>X('javascriptClassExtends'         , s:purple   , s:none , 'none')
call <Sid>X('javascriptClassKeyword'         , s:purple   , s:none , 'none')
call <Sid>X('javascriptDocNotation'          , s:purple   , s:none , 'none')
call <Sid>X('javascriptDocParamName'         , s:blue     , s:none , 'none')
call <Sid>X('javascriptDocTags'              , s:purple   , s:none , 'none')
call <Sid>X('javascriptEndColons'            , s:mono4    , s:none , 'none')
call <Sid>X('javascriptExport'               , s:purple   , s:none , 'none')
call <Sid>X('javascriptFuncArg'              , s:white    , s:none , 'none')
call <Sid>X('javascriptFuncKeyword'          , s:purple   , s:none , 'none')
call <Sid>X('javascriptIdentifier'           , s:red      , s:none , 'none')
call <Sid>X('javascriptImport'               , s:purple   , s:none , 'none')
call <Sid>X('javascriptObjectLabel'          , s:white    , s:none , 'none')
call <Sid>X('javascriptOpSymbol'             , s:cyan     , s:none , 'none')
call <Sid>X('javascriptOpSymbols'            , s:cyan     , s:none , 'none')
call <Sid>X('javascriptPropertyName'         , s:green    , s:none , 'none')
call <Sid>X('javascriptTemplateSB'           , s:red_dark , s:none , 'none')
call <Sid>X('javascriptVariable'             , s:purple   , s:none , 'none')

" JSON
call <Sid>X('jsonCommentError'       , s:white  , s:none , 'none')
call <Sid>X('jsonKeyword'            , s:red    , s:none , 'none')
call <Sid>X('jsonQuote'              , s:mono4  , s:none , 'none')
call <Sid>X('jsonTrailingCommaError' , s:red    , s:none , 'reverse')
call <Sid>X('jsonMissingCommaError'  , s:red    , s:none , 'reverse')
call <Sid>X('jsonNoQuotesError'      , s:red    , s:none , 'reverse')
call <Sid>X('jsonNumError'           , s:red    , s:none , 'reverse')
call <Sid>X('jsonString'             , s:green  , s:none , 'none')
call <Sid>X('jsonBoolean'            , s:purple , s:none , 'none')
call <Sid>X('jsonNumber'             , s:orange , s:none , 'none')
call <Sid>X('jsonStringSQError'      , s:red    , s:none , 'reverse')
call <Sid>X('jsonSemicolonError'     , s:red    , s:none , 'reverse')

" Markdown
call <Sid>X('markdownUrl'              , s:blue     , s:none , 'underline')
call <Sid>X('markdownBold'             , s:none     , s:none , 'bold')
call <Sid>X('markdownItalic'           , s:none     , s:none , 'bold')
call <Sid>X('markdownCode'             , s:orange   , s:none , 'none')
call <Sid>X('markdownCodeBlock'        , s:orange   , s:none , 'none')
call <Sid>X('markdownCodeDelimiter'    , s:orange   , s:none , 'none')
call <Sid>X('markdownHeadingDelimiter' , s:red_dark , s:none , 'none')
call <Sid>X('markdownH1'               , s:green    , s:none , 'bold')
call <Sid>X('markdownH2'               , s:green    , s:none , 'bold')
call <Sid>X('markdownH3'               , s:green    , s:none , 'bold')
call <Sid>X('markdownH3'               , s:green    , s:none , 'bold')
call <Sid>X('markdownH4'               , s:green    , s:none , 'bold')
call <Sid>X('markdownH5'               , s:green    , s:none , 'bold')
call <Sid>X('markdownH6'               , s:green    , s:none , 'bold')
call <Sid>X('markdownListMarker'       , s:red      , s:none , 'bold')

" PHP
call <Sid>X('phpClass'        , s:yellow , s:none , 'none')
call <Sid>X('phpFunction'     , s:blue   , s:none , 'none')
call <Sid>X('phpFunctions'    , s:blue   , s:none , 'none')
call <Sid>X('phpInclude'      , s:purple , s:none , 'none')
call <Sid>X('phpKeyword'      , s:purple , s:none , 'none')
call <Sid>X('phpParent'       , s:mono4  , s:none , 'none')
call <Sid>X('phpType'         , s:purple , s:none , 'none')
call <Sid>X('phpSuperGlobals' , s:red    , s:none , 'none')

" Pug (Formerly Jade)
call <Sid>X('pugAttributesDelimiter' , s:orange , s:none , 'none')
call <Sid>X('pugClass'               , s:orange , s:none , 'none')
call <Sid>X('pugDocType'             , s:mono4  , s:none , 'italic')
call <Sid>X('pugTag'                 , s:red    , s:none , 'none')

" PureScript
call <Sid>X('purescriptKeyword'     , s:purple , s:none , 'none')
call <Sid>X('purescriptModuleName'  , s:white  , s:none , 'none')
call <Sid>X('purescriptIdentifier'  , s:white  , s:none , 'none')
call <Sid>X('purescriptType'        , s:yellow , s:none , 'none')
call <Sid>X('purescriptTypeVar'     , s:red    , s:none , 'none')
call <Sid>X('purescriptConstructor' , s:red    , s:none , 'none')
call <Sid>X('purescriptOperator'    , s:white  , s:none , 'none')

" Python
call <Sid>X('pythonImport'          , s:purple , s:none , 'none')
call <Sid>X('pythonBuiltin'         , s:orange , s:none , 'none')
call <Sid>X('pythonStatement'       , s:purple , s:none , 'italic')
call <Sid>X('pythonParam'           , s:cyan   , s:none , 'none')
call <Sid>X('pythonSelf'            , s:yellow , s:none , 'none')
call <Sid>X('pythonClass'           , s:blue   , s:none , 'none')
call <Sid>X('pythonOperator'        , s:cyan   , s:none , 'none')
call <Sid>X('pythonEscape'          , s:cyan   , s:none , 'none')
call <Sid>X('pythonFunction'        , s:blue   , s:none , 'bold')
call <Sid>X('pythonKeyword'         , s:red    , s:none , 'none')
call <Sid>X('pythonModule'          , s:purple , s:none , 'none')
call <Sid>X('pythonStringDelimiter' , s:green  , s:none , 'none')
call <Sid>X('pythonSymbol'          , s:cyan   , s:none , 'none')

" Ruby
call <Sid>X('rubyBlock'                     , s:purple , s:none , 'none')
call <Sid>X('rubyBlockParameter'            , s:red    , s:none , 'none')
call <Sid>X('rubyBlockParameterList'        , s:red    , s:none , 'none')
call <Sid>X('rubyCapitalizedMethod'         , s:purple , s:none , 'none')
call <Sid>X('rubyClass'                     , s:purple , s:none , 'none')
call <Sid>X('rubyConstant'                  , s:yellow , s:none , 'none')
call <Sid>X('rubyControl'                   , s:purple , s:none , 'none')
call <Sid>X('rubyDefine'                    , s:purple , s:none , 'none')
call <Sid>X('rubyEscape'                    , s:red    , s:none , 'none')
call <Sid>X('rubyFunction'                  , s:blue   , s:none , 'none')
call <Sid>X('rubyGlobalVariable'            , s:red    , s:none , 'none')
call <Sid>X('rubyInclude'                   , s:blue   , s:none , 'none')
call <Sid>X('rubyIncluderubyGlobalVariable' , s:red    , s:none , 'none')
call <Sid>X('rubyInstanceVariable'          , s:red    , s:none , 'none')
call <Sid>X('rubyInterpolation'             , s:cyan   , s:none , 'none')
call <Sid>X('rubyInterpolationDelimiter'    , s:red    , s:none , 'none')
call <Sid>X('rubyKeyword'                   , s:blue   , s:none , 'none')
call <Sid>X('rubyModule'                    , s:purple , s:none , 'none')
call <Sid>X('rubyPseudoVariable'            , s:red    , s:none , 'none')
call <Sid>X('rubyRegexp'                    , s:cyan   , s:none , 'none')
call <Sid>X('rubyRegexpDelimiter'           , s:cyan   , s:none , 'none')
call <Sid>X('rubyStringDelimiter'           , s:green  , s:none , 'none')
call <Sid>X('rubySymbol'                    , s:cyan   , s:none , 'none')

" Vim
call <Sid>X('vimCommand'      , s:red        , s:none  , 'none')
call <Sid>X('vimCommentTitle' , s:mono4      , s:none  , 'bold')
call <Sid>X('vimFunction'     , s:blue       , s:none  , 'bold')
call <Sid>X('vimFuncName'     , s:blue_dark  , s:none  , 'bold')
call <Sid>X('vimHighlight'    , s:blue       , s:mono0 , 'none')
call <Sid>X('vimLineComment'  , s:mono4      , s:none  , 'none')
call <Sid>X('vimParenSep'     , s:blue       , s:none  , 'none')
call <Sid>X('vimSep'          , s:white      , s:none  , 'none')
call <Sid>X('vimUserFunc'     , s:blue_light , s:none  , 'none')
call <Sid>X('vimVar'          , s:yellow     , s:none  , 'none')

" XML
call <Sid>X('xmlAttrib'  , s:yellow , s:none , 'none')
call <Sid>X('xmlEndTag'  , s:red    , s:none , 'none')
call <Sid>X('xmlTag'     , s:red    , s:none , 'none')
call <Sid>X('xmlTagName' , s:red    , s:none , 'none')

" ZSH
call <Sid>X('zshCommands'    , s:white  , s:none , 'none')
call <Sid>X('zshDeref'       , s:red    , s:none , 'none')
call <Sid>X('zshShortDeref'  , s:red    , s:none , 'none')
call <Sid>X('zshFunction'    , s:cyan   , s:none , 'none')
call <Sid>X('zshKeyword'     , s:purple , s:none , 'none')
call <Sid>X('zshSubst'       , s:red    , s:none , 'none')
call <Sid>X('zshSubstDelim'  , s:mono4  , s:none , 'none')
call <Sid>X('zshTypes'       , s:purple , s:none , 'none')
call <Sid>X('zshVariableDef' , s:orange , s:none , 'none')

" Rust
call <Sid>X('rustExternCrate'          , s:red   , s:none , 'bold')
call <Sid>X('rustIdentifier'           , s:blue  , s:none , 'none')
call <Sid>X('rustDeriveTrait'          , s:green , s:none , 'none')
call <Sid>X('SpecialComment'           , s:mono4 , s:none , 'none')
call <Sid>X('rustCommentLine'          , s:mono4 , s:none , 'none')
call <Sid>X('rustCommentLineDoc'       , s:mono4 , s:none , 'none')
call <Sid>X('rustCommentLineDocError'  , s:mono4 , s:none , 'none')
call <Sid>X('rustCommentBlock'         , s:mono4 , s:none , 'none')
call <Sid>X('rustCommentBlockDoc'      , s:mono4 , s:none , 'none')
call <Sid>X('rustCommentBlockDocError' , s:mono4 , s:none , 'none')

" Man
call <Sid>X('manTitle'  , s:green  , s:none   , 'none')
call <Sid>X('manFooter' , s:mono4  , s:none   , 'none')

" Plugin Highlighting {{{1
  "
" Netrw (vim builtin)
call <Sid>X('netrwDir'      , s:blue       , s:none , 'none')
call <Sid>X('netrwClassify' , s:blue       , s:none , 'none')
call <Sid>X('netrwLink'     , s:cyan       , s:none , 'none')
call <Sid>X('netrwSymLink'  , s:cyan       , s:none , 'none')
call <Sid>X('netrwExe'      , s:green      , s:none , 'none')
call <Sid>X('netrwComment'  , s:mono4      , s:none , 'none')
call <Sid>X('netrwList'     , s:blue_light , s:none , 'none')
call <Sid>X('netrwHelpCmd'  , s:mono4      , s:none , 'none')
call <Sid>X('netrwCmdSep'   , s:white      , s:none , 'none')
call <Sid>X('netrwVersion'  , s:purple     , s:none , 'none')

" Startify (mhinz/vim-startify)
call <Sid>X('StartifyBracket' , s:white  , s:none , 'none')
call <Sid>X('StartifyFile'    , s:red    , s:none , 'bold')
call <Sid>X('StartifyNumber'  , s:yellow , s:none , 'none')
call <Sid>X('StartifyPath'    , s:blue   , s:none , 'none')
call <Sid>X('StartifySlash'   , s:white  , s:none , 'none')
call <Sid>X('StartifySection' , s:purple , s:none , 'none')
call <Sid>X('StartifySpecial' , s:mono4  , s:none , 'none')
call <Sid>X('StartifyHeader'  , s:green  , s:none , 'none')
call <Sid>X('StartifyFooter'  , s:green  , s:none , 'none')

" Neovim Builtins {{{1

" Neovim Support
call <Sid>X('healthError'   , s:red    , s:none  , 'none')
call <Sid>X('healthWarning' , s:yellow , s:none  , 'none')
call <Sid>X('healthSuccess' , s:green  , s:none  , 'none')
call <Sid>X('TermCursorNC'  , s:white  , s:none  , 'reverse')

" LSP Groups (descriptions and ordering from `:h lsp-highlight`)
call <Sid>X('LspReferenceText'                     , s:mono5  , s:none , 'none') " used for highlighting 'text' references
call <Sid>X('LspReferenceRead'                     , s:mono5  , s:none , 'none') " used for highlighting 'read' references
call <Sid>X('LspReferenceWrite'                    , s:mono5  , s:none , 'none') " used for highlighting 'write' references
call <Sid>X('LspDiagnosticsDefaultError'           , s:red    , s:none , 'none') " Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
call <Sid>X('LspDiagnosticsDefaultWarning'         , s:yellow , s:none , 'none') " Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
call <Sid>X('LspDiagnosticsDefaultInformation'     , s:blue   , s:none , 'none') " Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
call <Sid>X('LspDiagnosticsDefaultHint'            , s:mono5  , s:none , 'none') " Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
call <Sid>X('LspDiagnosticsVirtualTextError'       , s:red    , s:none , 'none') " Used for 'Error' diangostic virtal text. See vim.lsp.diagnsotic.set_virtual_text()
call <Sid>X('LspDiagnosticsVirtualTextWarning'     , s:yellow , s:none , 'none') " Used for 'Warning' diangostic virtal text. See vim.lsp.diagnsotic.set_virtual_text()
call <Sid>X('LspDiagnosticsVirtualTextInformation' , s:red    , s:none , 'none') " Used for 'Error' diangostic virtal text. See vim.lsp.diagnsotic.set_virtual_text()
call <Sid>X('LspDiagnosticsVirtualTextHint'        , s:mono5  , s:none , 'none') " Used for 'Hint' diangostic virtal text. See vim.lsp.diagnsotic.set_virtual_text()
call <Sid>X('LspDiagnosticsVirtualUnderlineError'  , s:red    , s:none , 'none') " Used to underline 'Error' diagnostics. See vim.lsp.diagnostic.set_underline()
call <Sid>X('LspDiagnosticsUnderlineError'         , s:yellow , s:none , 'none') " Used to underline 'Warning' diagnostics. See vim.lsp.diagnostic.set_underline()
call <Sid>X('LspDiagnosticsUnderlineInformation'   , s:blue   , s:none , 'none') " Used to underline 'Information' diagnostics. See vim.lsp.diagnostic.set_underline()
call <Sid>X('LspDiagnosticsUnderlineHint'          , s:mono5  , s:none , 'none') " Used to underline 'Hint' diagnostics. See vim.lsp.diagnostic.set_underline()
call <Sid>X('LspDiagnosticsFloatError'             , s:red    , s:none , 'none') " Used to color 'Error' diagnostic messages in diagnostics float. See vim.lsp.diagnsotic.show_line_diagnostics()
call <Sid>X('LspDiagnosticsFloatWarning'           , s:yellow , s:none , 'none') " Used to color 'Warning' diagnostic messages in diagnostics float. See vim.lsp.diagnsotic.show_line_diagnostics()
call <Sid>X('LspDiagnosticsFloatInformation'       , s:blue   , s:none , 'none') " Used to color 'Information' diagnostic messages in diagnostics float. See vim.lsp.diagnsotic.show_line_diagnostics()
call <Sid>X('LspDiagnosticsFloatHint'              , s:mono5  , s:none , 'none') " Used to color 'Hint' diagnostic messages in diagnostics float. See vim.lsp.diagnsotic.show_line_diagnostics()
call <Sid>X('LspDiagnosticsSignError'              , s:red    , s:none , 'none') " Used to color 'Error' signs in sign column. See vim.lsp.diagnostic.set_signs()
call <Sid>X('LspDiagnosticsSignWarning'            , s:yellow , s:none , 'none') " Used to color 'Warning' signs in sign column. See vim.lsp.diagnostic.set_signs()
call <Sid>X('LspDiagnosticsSignInformation'        , s:blue   , s:none , 'none') " Used to color 'Information' signs in sign column. See vim.lsp.diagnostic.set_signs()
call <Sid>X('LspDiagnosticsSignHint'               , s:mono5  , s:none , 'none') " Used to color 'Hint' signs in sign column. See vim.lsp.diagnostic.set_signs()

" Nvim Treesitter Groups (descriptions and ordering from `:h nvim-treesitter-highlights`)
call <Sid>X('TSAnnotation'         , s:yellow       , s:none , 'none')      " For C++/Dart attributes ,annotations that can be attached to the code to denote some kind of meta information.
call <Sid>X('TSAttribute'          , s:cyan         , s:none , 'none')      " unstable TODO: docs
call <Sid>X('TSBoolean'            , s:orange       , s:none , 'none')      " For booleans
call <Sid>X('TSCharacter'          , s:green_light  , s:none , 'none')      " For characters
call <Sid>X('TSComment'            , s:mono4        , s:none , 'none')      " For commented blocks.
call <Sid>X('TSConstructor'        , s:cyan         , s:none , 'none')      " For constructor calls and definitions: {} in Lua, and Java constructors.
call <Sid>X('TSConditional'        , s:purple       , s:none , 'italic')    " For keywords related to conditionnals
call <Sid>X('TSConstant'           , s:orange       , s:none , 'none')      " For constants
call <Sid>X('TSConstBuiltin'       , s:orange       , s:none , 'none')      " For constant that are built in the language: `nil` in Lua
call <Sid>X('TSConstMacro'         , s:cyan         , s:none , 'none')      " For constants that are defined by macros: `NULL` in C
call <Sid>X('TSError'              , s:red          , s:none , 'none')      " For syntax/par
call <Sid>X('TSException'          , s:red_light    , s:none , 'italic')    " For exception related keywords.
call <Sid>X('TSField'              , s:red          , s:none , 'none')      " For fields.
call <Sid>X('TSFloat'              , s:yellow_light , s:none , 'none')      " For floats
call <Sid>X('TSFunction'           , s:blue         , s:none , 'bold')      " For function (calls and definitions
call <Sid>X('TSFuncBuiltin'        , s:blue         , s:none , 'bold')      " For builtin functions: `table.insert` in Lua
call <Sid>X('TSFuncMacro'          , s:yellow       , s:none , 'none')      " For macro defined functions (calls and definitions): each `macro_rules` in Rust.
call <Sid>X('TSInclude'            , s:blue         , s:none , 'none')      " For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
call <Sid>X('TSKeyword'            , s:red          , s:none , 'italic')    " For keywords that don't fall in previous categories.
call <Sid>X('TSKeywordFunction'    , s:red          , s:none , 'none')      " For keywords used to define a function.
call <Sid>X('TSLabel'              , s:purple       , s:none , 'italic')    " For labels: `label:` in C and `:label:` in Lua
call <Sid>X('TSMethod'             , s:blue         , s:none , 'none')      " For method calls and definitions.
call <Sid>X('TSNamespace'          , s:red_light    , s:none , 'none')      " For identifiers referring to modules and namespaces.
call <Sid>X('TSNumber'             , s:yellow       , s:none , 'none')      " For integers
call <Sid>X('TSOperator'           , s:cyan         , s:none , 'none')      " For any operator: `+`, but also `->` and `*` in C
call <Sid>X('TSParameter'          , s:cyan         , s:none , 'none')      " For parameters of a function.
call <Sid>X('TSParameterReference' , s:cyan         , s:none , 'none')      " For references to parameters of a function.
call <Sid>X('TSProperty'           , s:red          , s:none , 'none')      " Same as `TSField`.
call <Sid>X('TSPunctDelimiter'     , s:white        , s:none , 'none')      " For delimiters ie: `.
call <Sid>X('TSPunctBracket'       , s:blue         , s:none , 'none')      " For brackets and parens
call <Sid>X('TSPunctSpecial'       , s:white        , s:none , 'none')      " For special punctuation that does not fall in the categories before
call <Sid>X('TSRepeat'             , s:purple       , s:none , 'italic')    " For keywords related to loops
call <Sid>X('TSString'             , s:green        , s:none , 'none')      " For strings
call <Sid>X('TSStringRegex'        , s:green_light  , s:none , 'none')      " For regexes
call <Sid>X('TSStringEscape'       , s:cyan         , s:none , 'none')      " For escape characters within a string
call <Sid>X('TSStructure'          , s:yellow       , s:none , 'bold')      " This is left as an exercise for the reader.
call <Sid>X('TSStrong'             , s:none         , s:none , 'bold')      " For text to be represented with strong.
call <Sid>X('TSTag'                , s:none         , s:none , 'none')      " Tags like html tag names.
call <Sid>X('TSTagDelimeter'       , s:blue         , s:none , 'none')      " Tag delimiter link < > /
call <Sid>X('TSText'               , s:green_dark   , s:none , 'none')      " For strings considered text in a markup language.
call <Sid>X('TSEmphasis'           , s:none         , s:none , 'italic')    " For text to be represented with emphasis.
call <Sid>X('TSUnderline'          , s:blue         , s:none , 'underline') " TSUnderline
call <Sid>X('TSTitle'              , s:none         , s:none , 'bold')      " Text that is part of a title.
call <Sid>X('TSLiteral'            , s:green_dark   , s:none , 'bold')      " Literal text.
call <Sid>X('TSURI'                , s:blue         , s:none , 'underline') " Any URI like a link or email.
call <Sid>X('TSType'               , s:yellow       , s:none , 'none')      " For types.
call <Sid>X('TSTypeBuiltin'        , s:yellow       , s:none , 'none')      " For builtin types (you guessed it, right ?).
call <Sid>X('TSVariable'           , s:white        , s:none , 'none')      " Variable names
call <Sid>X('TSVariableBuiltin'    , s:yellow       , s:none , 'none')      " Variable names that are defined by the languages, like `this` or `self`.

" }}}1
