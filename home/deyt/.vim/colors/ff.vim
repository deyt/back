set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "hcolor"

hi Comment guifg=#9f9f9f
hi Constant guifg=#ffbe7c guibg=gray30
hi Cursor guifg=#444444 guibg=gray80
hi CursorColumn guibg=gray40
hi CursorIM gui=None
hi CursorLine guibg=gray40
hi DiffAdd guibg=darkblue
hi DiffChange guibg=darkmagenta
hi DiffDelete gui=bold guifg=blue guibg=darkcyan
hi DiffText gui=bold guibg=red
hi Directory guifg=cyan
hi Error guifg=white guibg=red
hi ErrorMsg guifg=white guibg=red
hi FoldColumn guifg=darkblue guibg=grey
hi Folded guifg=darkblue guibg=lightgrey
hi Identifier guifg=white
hi Ignore guifg=gray20
hi IncSearch gui=reverse
hi LineNr guifg=yellow
hi MatchParen guifg=#111111 guibg=#bbbbbb
hi ModeMsg gui=bold
hi MoreMsg gui=bold guifg=seagreen
hi NonText gui=bold guifg=lightblue guibg=gray30
hi Normal guifg=white guibg=gray30
hi Pmenu guibg=magenta
hi PmenuSbar guibg=grey
hi PmenuSel guibg=darkgray
hi PmenuThumb gui=reverse
hi PreProc guifg=white
hi Question gui=bold guifg=green
hi Search guifg=black guibg=yellow
hi SignColumn guifg=cyan guibg=grey
hi Special guifg=orange guibg=gray30
hi SpecialKey guifg=cyan
hi SpellBad gui=undercurl
hi SpellCap gui=undercurl
hi SpellLocal gui=undercurl
hi SpellRare gui=undercurl
hi Statement gui=bold guifg=white
hi StatusLine gui=bold,reverse
hi StatusLineNC gui=reverse
hi TabLine gui=underline guibg=darkgray
hi TabLineFill gui=reverse
hi TabLineSel gui=bold
hi Title guifg=white
hi Todo guifg=blue guibg=yellow
hi Type gui=bold guifg=white
hi Underlined gui=underline guifg=#80a0ff
hi VertSplit gui=reverse
hi Visual guibg=gray60
hi VisualNOS gui=bold,underline
hi WarningMsg guifg=red
hi WildMenu guifg=black guibg=yellow
hi link Boolean Constant
hi link Character Constant
hi link Conditional Statement
hi link Debug Special
hi link Define PreProc
hi link Delimiter Special
hi link Exception Statement
hi link Float Constant
hi link Function Identifier
hi link Include PreProc
hi link Keyword Statement
hi link Label Statement
hi link Macro PreProc
hi link Number Constant
hi link Operator Statement
hi link PreCondit PreProc
hi link Repeat Statement
hi link SpecialChar Special
hi link SpecialComment Special
hi link StorageClass Type
hi link String Constant
hi link Structure Type
hi link Tag Special
hi link Typedef Type

