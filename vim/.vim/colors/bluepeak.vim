" Vim color file
"

set background=light

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="bluepeak"

hi Cursor          guifg=#ffffff guibg=#f92672
hi Normal          guifg=#323232 guibg=#f5f5f5
hi CursorLine                    guibg=#ebebeb
hi CursorColumn                  guibg=#ebebeb
hi ColorColumn     guifg=fg      guibg=#f1f1f1
hi LineNr          guifg=#aaaaaa guibg=#ebebeb
hi NonText         guifg=#e10096 guibg=#f5f5f5

hi Boolean         guifg=#6b9cee
hi Float           guifg=#9d76e3
hi Character       guifg=#9d76e3
hi Number          guifg=#554196
hi String          guifg=#5270a3
hi Constant        guifg=#AE81FF               gui=bold
hi Keyword         guifg=#00a0f5               gui=bold
hi Statement       guifg=#f92672               gui=bold

hi Conditional     guifg=#f92672               gui=bold
hi Define          guifg=#00a0f5
hi Delimiter       guifg=#3a5c86
hi StorageClass    guifg=#004eb9
hi Structure       guifg=#462183

hi Comment         guifg=#888888
hi Debug           guifg=#f92672               gui=bold
hi Function        guifg=#2c2c2c               gui=bold
hi Identifier      guifg=#232323
hi Operator        guifg=#462183               gui=bold
hi Ignore          guifg=#808080 guibg=bg
hi Exception       guifg=#81bb0E               gui=bold
hi Error           guifg=#ffffff guibg=#d72828

hi DiffAdd         guifg=#72af20 guibg=#f5f2da
hi DiffChange      guifg=#f68500 guibg=#f5f2da
hi DiffDelete      guifg=#d72828 guibg=#f5f2da
hi DiffText                      guibg=#f5f2da gui=italic,bold

hi Directory       guifg=#00a0f5               gui=bold
hi ErrorMsg        guifg=#ffffff guibg=#d72828 gui=bold
hi FoldColumn      guifg=#666666 guibg=#f3fee3
hi Folded          guifg=#666666 guibg=#f3fee3

hi IncSearch       guifg=#455354 guibg=#ffffff
hi Search          guifg=#ffffff guibg=#667782

hi Label           guifg=#9d76e3               gui=none
hi Macro           guifg=#004eb9               gui=italic
hi SpecialKey      guifg=#66D9EF               gui=italic

hi MatchParen      guifg=#ffffff guibg=#72af20 gui=bold
hi ModeMsg         guifg=#323232
hi MoreMsg         guifg=#323232

" complete menu
hi Pmenu           guifg=#555555 guibg=#ebebeb
hi PmenuSel        guifg=#ffffff guibg=#f92672
hi PmenuSbar       guifg=#888888 guibg=#080808
hi PmenuThumb      guifg=#00a0f5

hi PreCondit       guifg=#8dc63f               gui=bold
hi PreProc         guifg=#72af20
hi Question        guifg=#72af20
hi Repeat          guifg=#F92672               gui=bold

" marks column
hi SignColumn      guifg=#f92672 guibg=#ebebeb
hi SpecialChar     guifg=#F92672               gui=bold
hi SpecialComment  guifg=#888888 gui=bold
hi Special         guifg=#6b9cee guibg=bg      gui=italic
hi SpecialKey      guifg=#888A85               gui=italic

if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif

hi StatusLine      guifg=#dcdcdc guibg=#333333
hi StatusLineNC    guifg=#ebebeb guibg=#888888
hi Title           guifg=#72af20
hi Todo            guifg=#ffffff guibg=#462183 gui=bold

hi Typedef         guifg=#66D9EF
hi Type            guifg=#462183               gui=none
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#888888 guibg=#ebebeb gui=bold
hi VisualNOS                     guibg=#d0e6f4
hi Visual                        guibg=#d0e6f4
hi WarningMsg      guifg=#d72828 guibg=bg      gui=bold
hi WildMenu        guifg=#f92672 guibg=#dcdcdc gui=bold


" Html custom colors
hi htmlTagName     guifg=#462183               gui=bold
hi htmlArg         guifg=#004eb9
hi htmlLink        guifg=#3966cc               gui=underline


" Showmarks color
hi ShowMarksHLu    guifg=#ffffff guibg=#462183 gui=bold
hi ShowMarksHLl    guifg=#000000 guibg=#81bb0E gui=bold
hi ShowMarksHLo    guifg=#dcdcdc guibg=#aaaaaa gui=bold
