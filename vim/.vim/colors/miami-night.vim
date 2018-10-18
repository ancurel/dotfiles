" vim:fdm=marker
"
" Vim colorscheme template file
" Author: Gert van Deuren

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="Miami Night"

if !exists("g:miami_night_use_Xresources")
    let g:miami_night_use_Xresources = 0
endif
if !exists("g:miami_night_use_truecolor")
    let g:miami_night_use_truecolor = 0
endif


" Define colors {{{
" --------------------------------------------------------------------
if has("gui_running")
    let s:background   = "#181818"
else
    let s:background   = "NONE"
endif


if has("gui_running") || g:miami_night_use_truecolor == 1
    " TODO gui colors
    let s:vmode        = "gui"
    let s:foreground   = "#b2b2b2"
    let s:window       = "#d70000"
    let s:darkcolumn   = "#090909"
    let s:cursor       = "#222222"
    let s:selection    = "#777777"

    let s:white        = "#ececec"
    let s:grey         = "#777777"
    let s:grey_light   = "#999999"
    let s:grey_dark    = "#555555"
    let s:red          = "#d83b8c"
    let s:red_light    = "#fa54a5"
    let s:cyan         = "#25d4e2"
    let s:cyan_light   = "#46f7ff"
    let s:blue         = "#68aff7"
    let s:blue_light   = "#939bcc"
    let s:blue_dark    = "#5a70ad"
    let s:violet       = "#6305e6"
    let s:violet_light = "#8056f3"
    let s:purple       = "#8f45f7"
    let s:purple_light = "#ad73f9"
else
    let s:vmode        = "cterm"
    let s:foreground   = "249"
    let s:window       = "236"
    let s:darkcolumn   = "232"
    let s:cursor       = "235"
    let s:selection    = "238"

    let s:white        = "255"
    let s:grey         = "243"
    let s:grey_light   = "245"
    let s:grey_dark    = "239"
    let s:red          = "162"
    let s:red_light    = "169"
    let s:cyan         = "116"
    let s:cyan_light   = "123"
    let s:blue         = "111"
    let s:blue_light   = "104"
    let s:blue_dark    = "24"
    let s:violet       = "56"
    let s:violet_light = "99"
    let s:purple       = "92"
    let s:purple_light = "135"

    if g:miami_night_use_Xresources == 1
        let s:red          = "1"
        let s:red_light    = "9"
        let s:cyan         = "2"
        let s:cyan_light   = "10"
        let s:blue         = "4"
        let s:blue_light   = "3"
        let s:blue_dark    = "11"
        let s:violet       = "6"
        let s:violet_light = "14"
        let s:purple       = "13"
        let s:purple_light = "5"
    endif
endif
" }}}

" Formatting Options:"{{{
" --------------------------------------------------------------------
let s:none   = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"
" }}}

" Highlighting Primitives:"{{{
" ----------------------------------------------------------------------------
exe "let s:bg_none         = ' ".s:vmode."bg=".s:none         ."'"
exe "let s:bg_foreground   = ' ".s:vmode."bg=".s:foreground   ."'"
exe "let s:bg_background   = ' ".s:vmode."bg=".s:background   ."'"
exe "let s:bg_darkcolumn   = ' ".s:vmode."bg=".s:darkcolumn   ."'"
exe "let s:bg_cursor       = ' ".s:vmode."bg=".s:cursor       ."'"
exe "let s:bg_selection    = ' ".s:vmode."bg=".s:selection    ."'"
exe "let s:bg_white        = ' ".s:vmode."bg=".s:white        ."'"
exe "let s:bg_grey         = ' ".s:vmode."bg=".s:grey         ."'"
exe "let s:bg_grey_light   = ' ".s:vmode."bg=".s:grey_light   ."'"
exe "let s:bg_grey_dark    = ' ".s:vmode."bg=".s:grey_dark    ."'"
exe "let s:bg_red          = ' ".s:vmode."bg=".s:red          ."'"
exe "let s:bg_red_light    = ' ".s:vmode."bg=".s:red_light    ."'"
exe "let s:bg_cyan         = ' ".s:vmode."bg=".s:cyan         ."'"
exe "let s:bg_cyan_light   = ' ".s:vmode."bg=".s:cyan_light   ."'"
exe "let s:bg_blue         = ' ".s:vmode."bg=".s:blue         ."'"
exe "let s:bg_blue_light   = ' ".s:vmode."bg=".s:blue_light   ."'"
exe "let s:bg_blue_dark    = ' ".s:vmode."bg=".s:blue_dark    ."'"
exe "let s:bg_violet       = ' ".s:vmode."bg=".s:violet       ."'"
exe "let s:bg_violet_light = ' ".s:vmode."bg=".s:violet_light ."'"
exe "let s:bg_purple       = ' ".s:vmode."bg=".s:purple       ."'"
exe "let s:bg_purple_light = ' ".s:vmode."bg=".s:purple_light ."'"

exe "let s:fg_none         = ' ".s:vmode."fg=".s:none         ."'"
exe "let s:fg_foreground   = ' ".s:vmode."fg=".s:foreground   ."'"
exe "let s:fg_background   = ' ".s:vmode."fg=".s:background   ."'"
exe "let s:fg_selection    = ' ".s:vmode."fg=".s:selection    ."'"
exe "let s:fg_darkcolumn   = ' ".s:vmode."fg=".s:darkcolumn   ."'"
exe "let s:fg_white        = ' ".s:vmode."fg=".s:white        ."'"
exe "let s:fg_grey         = ' ".s:vmode."fg=".s:grey         ."'"
exe "let s:fg_grey_light   = ' ".s:vmode."fg=".s:grey_light   ."'"
exe "let s:fg_grey_dark    = ' ".s:vmode."fg=".s:grey_dark    ."'"
exe "let s:fg_red          = ' ".s:vmode."fg=".s:red          ."'"
exe "let s:fg_red_light    = ' ".s:vmode."fg=".s:red_light    ."'"
exe "let s:fg_cyan         = ' ".s:vmode."fg=".s:cyan         ."'"
exe "let s:fg_cyan_light   = ' ".s:vmode."fg=".s:cyan_light   ."'"
exe "let s:fg_blue         = ' ".s:vmode."fg=".s:blue         ."'"
exe "let s:fg_blue_light   = ' ".s:vmode."fg=".s:blue_light   ."'"
exe "let s:fg_blue_dark    = ' ".s:vmode."fg=".s:blue_dark    ."'"
exe "let s:fg_violet       = ' ".s:vmode."fg=".s:violet       ."'"
exe "let s:fg_violet_light = ' ".s:vmode."fg=".s:violet_light ."'"
exe "let s:fg_purple       = ' ".s:vmode."fg=".s:purple       ."'"
exe "let s:fg_purple_light = ' ".s:vmode."fg=".s:purple_light ."'"

exe "let s:fmt_none      = ' ".s:vmode."=NONE".          " term=NONE"        ."'"
exe "let s:fmt_none      = ' ".s:vmode."=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bold      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb      = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl      = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital      = ' ".s:vmode."=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd      = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr      = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb      = ' ".s:vmode."=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"
" }}}


" Editor settings
" ----------------------------------------------------------------------------
if has('gui_running') || (g:miami_night_use_truecolor == 1) || (g:miami_night_use_Xresources != 1)
  exe "hi! Normal"       .s:fg_foreground   .s:bg_background  .s:fmt_none
else
  exe "hi! Normal"       .s:fg_foreground   .s:bg_none        .s:fmt_none
endif

exe "hi! Cursor"         .s:fg_none         .s:bg_grey        .s:fmt_none
exe "hi! CursorLine"     .s:fg_none         .s:bg_cursor      .s:fmt_none
exe "hi! LineNr"         .s:fg_grey_dark    .s:bg_darkcolumn  .s:fmt_none
exe "hi! CursorLineNR"   .s:fg_grey_light   .s:bg_none        .s:fmt_none


" Number column
" ----------------------------------------------------------------------------
exe "hi! CursorColumn"  .s:fg_none         .s:bg_cursor       .s:fmt_none
exe "hi! FoldColumn"    .s:fg_purple       .s:bg_none         .s:fmt_none
exe "hi! SignColumn"    .s:fg_grey_light   .s:bg_none         .s:fmt_none
exe "hi! Folded"        .s:fg_blue_light   .s:bg_none         .s:fmt_none


" Window/Tab delimiters 
" ----------------------------------------------------------------------------
exe "hi! VertSplit"     .s:fg_grey_dark    .s:bg_none         .s:fmt_none
hi! ColorColumn  ctermfg=none  ctermbg=none  cterm=none
hi! TabLine      ctermfg=none  ctermbg=none  cterm=none
hi! TabLineFill  ctermfg=none  ctermbg=none  cterm=none
hi! TabLineSel   ctermfg=none  ctermbg=none  cterm=none


" - File Navigation / Searching -
" ----------------------------------------------------------------------------
exe "hi! Directory"     .s:fg_purple_light  .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_white         .s:bg_violet      .s:fmt_none
exe "hi! IncSearch"     .s:fg_darkcolumn    .s:bg_cyan_light  .s:fmt_none


" - Prompt/Status -
" ----------------------------------------------------------------------------
exe "hi! Statusline"    .s:fg_grey_light    .s:bg_none        .s:fmt_none
exe "hi! StatuslineNC"  .s:fg_grey          .s:bg_none        .s:fmt_none
exe "hi! WildMenu"      .s:fg_purple_light  .s:bg_none        .s:fmt_none
exe "hi! Question"      .s:fg_blue_light    .s:bg_none        .s:fmt_bold
exe "hi! Title"         .s:fg_grey          .s:bg_none        .s:fmt_none
exe "hi! ModeMsg"       .s:fg_cyan          .s:bg_none        .s:fmt_none


" - Visual aid -
" ----------------------------------------------------------------------------
exe "hi! MatchParen"    .s:fg_white         .s:bg_none        .s:fmt_bold
exe "hi! Visual"        .s:fg_none          .s:bg_selection   .s:fmt_none
exe "hi! VisualNOS"     .s:fg_none          .s:bg_selection   .s:fmt_none
exe "hi! NonText"       .s:fg_purple        .s:bg_none        .s:fmt_none
exe "hi! Todo"          .s:fg_darkcolumn    .s:bg_purple      .s:fmt_none
exe "hi! Underlined"    .s:fg_none          .s:bg_none        .s:fmt_undr
exe "hi! Error"         .s:fg_red           .s:bg_none        .s:fmt_bold
exe "hi! ErrorMsg"      .s:fg_red           .s:bg_none        .s:fmt_none
exe "hi! WarningMsg"    .s:fg_purple        .s:bg_none        .s:fmt_none
exe "hi! SpecialKey"    .s:fg_blue          .s:bg_none        .s:fmt_none


" Variable types
" ----------------------------------------------------------------------------
exe "hi! Constant"        .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_grey_light  .s:bg_none        .s:fmt_none
exe "hi! StringDelimiter" .s:fg_red         .s:bg_none        .s:fmt_none
exe "hi! Character"       .s:fg_blue_light  .s:bg_none        .s:fmt_none
exe "hi! Number"          .s:fg_cyan_light  .s:bg_none        .s:fmt_none
exe "hi! Float"           .s:fg_cyan_light  .s:bg_none        .s:fmt_none
exe "hi! Boolean"         .s:fg_cyan        .s:bg_none        .s:fmt_none
exe "hi! Identifier"      .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_white       .s:bg_none        .s:fmt_none


" Language constructs
" ----------------------------------------------------------------------------
exe "hi! Statement"       .s:fg_purple_light .s:bg_none        .s:fmt_none
exe "hi! Conditional"     .s:fg_purple       .s:bg_none        .s:fmt_none
exe "hi! Repeat"          .s:fg_purple       .s:bg_none        .s:fmt_none
exe "hi! Operator"        .s:fg_blue_light   .s:bg_none        .s:fmt_none
exe "hi! Keyword"         .s:fg_purple_light .s:bg_none        .s:fmt_none
exe "hi! Exception"       .s:fg_cyan         .s:bg_none        .s:fmt_none
exe "hi! Comment"         .s:fg_grey         .s:bg_none        .s:fmt_none
hi! link Label Keyword
hi! link SpecialComment Comment

exe "hi! Special"         .s:fg_purple_light .s:bg_none        .s:fmt_none
exe "hi! Delimiter"       .s:fg_purple_light .s:bg_none        .s:fmt_none
exe "hi! Debug"           .s:fg_white        .s:bg_grey_dark   .s:fmt_none
hi! link Special Tag
hi! link Special SpecialChar


" - C like -
" ----------------------------------------------------------------------------
exe "hi! Type"            .s:fg_blue_light   .s:bg_none        .s:fmt_none
exe "hi! Storage"         .s:fg_grey_light   .s:bg_none        .s:fmt_none
exe "hi! StorageClass"    .s:fg_grey_light   .s:bg_none        .s:fmt_none
exe "hi! Structure"       .s:fg_blue_light   .s:bg_none        .s:fmt_none
exe "hi! Typedef"         .s:fg_blue_light   .s:bg_none        .s:fmt_none

exe "hi! Include"         .s:fg_cyan         .s:bg_none        .s:fmt_none
exe "hi! Define"          .s:fg_grey_light   .s:bg_none        .s:fmt_none
exe "hi! PreProc"         .s:fg_cyan         .s:bg_none        .s:fmt_none
hi! Macro      ctermfg=none  ctermbg=none  cterm=none
hi! PreCondit  ctermfg=none  ctermbg=none  cterm=none


" Diff
" ----------------------------------------------------------------------------
exe "hi! DiffAdd"         .s:fg_cyan         .s:bg_grey_dark   .s:fmt_none
exe "hi! DiffChange"      .s:fg_grey         .s:bg_none        .s:fmt_none
exe "hi! DiffDelete"      .s:fg_red          .s:bg_none        .s:fmt_none
exe "hi! DiffText"        .s:fg_blue_light   .s:bg_none        .s:fmt_none


" Completion menu
" ----------------------------------------------------------------------------
exe "hi! Pmenu"           .s:fg_grey_light   .s:bg_darkcolumn  .s:fmt_none
exe "hi! PmenuSel"        .s:fg_cyan         .s:bg_background  .s:fmt_none
exe "hi! PmenuSbar"       .s:fg_purple       .s:bg_background  .s:fmt_none
exe "hi! PmenuThumb"      .s:fg_purple       .s:bg_background  .s:fmt_none


" TODO: Spelling
" ----------------------------------------------------------------------------
hi! SpellBad    ctermfg=none  ctermbg=none  cterm=none
hi! SpellCap    ctermfg=none  ctermbg=none  cterm=none
hi! SpellLocal  ctermfg=none  ctermbg=none  cterm=none
hi! SpellRare   ctermfg=none  ctermbg=none  cterm=none


" Vim help
" ----------------------------------------------------------------------------
exe "hi! helpOption"        .s:fg_white        .s:bg_none       .s:fmt_none
exe "hi! helpExample"       .s:fg_blue_light   .s:bg_none       .s:fmt_none
exe "hi! helpNote"          .s:fg_white        .s:bg_none       .s:fmt_bold
exe "hi! helpHeadline"      .s:fg_cyan         .s:bg_none       .s:fmt_none
exe "hi! helpSectionDelim"  .s:fg_grey_dark    .s:bg_none       .s:fmt_none
exe "hi! helpHyperTextEntry".s:fg_grey_light   .s:bg_none       .s:fmt_none


" PHP colors
" ----------------------------------------------------------------------------
exe "hi! phpComparison"     .s:fg_none         .s:bg_none       .s:fmt_none
exe "hi! phpFunctions"      .s:fg_white        .s:bg_none       .s:fmt_none
exe "hi! phpIdentifier"     .s:fg_foreground   .s:bg_none       .s:fmt_none
exe "hi! phpMemberSelector" .s:fg_cyan         .s:bg_none       .s:fmt_none
exe "hi! phpMethodsVar"     .s:fg_none         .s:bg_none       .s:fmt_none
exe "hi! phpParent"         .s:fg_purple       .s:bg_none       .s:fmt_none
exe "hi! phpRegion"         .s:fg_none         .s:bg_none       .s:fmt_none
exe "hi! phpStaticClasses"  .s:fg_white        .s:bg_none       .s:fmt_none
exe "hi! phpVarSelector"    .s:fg_grey         .s:bg_none       .s:fmt_none


" Javascript colors
" ----------------------------------------------------------------------------
exe "hi! jsFunction"      .s:fg_grey_light   .s:bg_none        .s:fmt_none
exe "hi! jsFuncName"      .s:fg_white        .s:bg_none        .s:fmt_none
exe "hi! jsFuncBraces"    .s:fg_blue_light   .s:bg_none        .s:fmt_none
exe "hi! jsFuncBlock"     .s:fg_blue_light   .s:bg_none        .s:fmt_none
exe "hi! jsGlobalObjects" .s:fg_blue         .s:bg_none        .s:fmt_none
exe "hi! jsFunctionKey"   .s:fg_cyan         .s:bg_none        .s:fmt_none
exe "hi! jsStorageClass"  .s:fg_cyan         .s:bg_none        .s:fmt_none
exe "hi! jsObjectKey"     .s:fg_blue_light   .s:bg_none        .s:fmt_none
exe "hi! jsThis"          .s:fg_blue_light   .s:bg_none        .s:fmt_none
hi! link jsBraces       Delimiter
hi! link jsParens       Delimiter
hi! link jsFuncCall     jsFuncName
hi! link jsComment      Comment
hi! link jsLineComment  Comment


" HTML colors
" ----------------------------------------------------------------------------
exe "hi! HtmlTag"         .s:fg_foreground   .s:bg_none        .s:fmt_none
exe "hi! HtmlEndTag"      .s:fg_grey_light   .s:bg_none        .s:fmt_none
exe "hi! htmlH1"          .s:fg_white        .s:bg_none        .s:fmt_none
hi! link htmlH1 htmlH2
hi! link htmlH1 htmlH3
hi! link htmlH1 htmlH4
hi! link htmlH1 htmlH5


" CSS colors
" ----------------------------------------------------------------------------
exe "hi! cssClassName"      .s:fg_purple_light .s:bg_none        .s:fmt_none
exe "hi! cssBraces"         .s:fg_purple       .s:bg_none        .s:fmt_none
exe "hi! cssProp"           .s:fg_foreground   .s:bg_none        .s:fmt_none
exe "hi! cssTagName"        .s:fg_white        .s:bg_none        .s:fmt_none
exe "hi! cssImportant"      .s:fg_blue         .s:bg_none        .s:fmt_none
exe "hi! cssAttr"           .s:fg_blue_light   .s:bg_none        .s:fmt_none
exe "hi! cssValueLength"    .s:fg_blue_light   .s:bg_none        .s:fmt_none
exe "hi! cssValueNumber"    .s:fg_blue_light   .s:bg_none        .s:fmt_none
exe "hi! cssColor"          .s:fg_blue_light   .s:bg_none        .s:fmt_none
exe "hi! cssUnitDecorators" .s:fg_blue         .s:bg_none        .s:fmt_none
exe "hi! cssIncludeKeyword" .s:fg_cyan         .s:bg_none        .s:fmt_none
exe "hi! cssNoise"          .s:fg_grey_light   .s:bg_none        .s:fmt_none

" TWIG colors
" ----------------------------------------------------------------------------
exe "hi! twigString"       .s:fg_grey_light   .s:bg_none        .s:fmt_none

