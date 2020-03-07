" =============================================================================
" Filename: autoload/lightline/colorscheme/freebsd.vim
" Author: bandithijo
" License: MIT License
" Last Change: 2020/02/29 07:26:01
" =============================================================================

let s:p                 = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ ['white', 'brightred', 'bold'], ['white', 'gray4'] ]
let s:p.normal.right    = [ ['gray5', 'gray10', 'bold'], ['gray9', 'gray4'], ['gray8', 'gray2'] ]
let s:p.inactive.right  = [ ['gray1', 'gray4'] ]
let s:p.inactive.left   = [ ['gray1', 'gray4', 'bold'] ]
let s:p.inactive.middle = [ ['gray1', 'gray4'] ]
let s:p.insert.left     = [ ['red', 'white', 'bold'], ['white', 'darkestred'] ]
let s:p.insert.right    = [ [ 'white', 'darkestred' ], [ 'white', 'darkred' ], [ 'white', 'mediumred'] ]
let s:p.replace.left    = [ ['white', 'green', 'bold'], ['white', 'gray4'] ]
let s:p.visual.left     = [ ['white', 'blue', 'bold'], ['white', 'gray4'] ]
let s:p.normal.middle   = [ ['gray7', 'gray2'] ]
let s:p.insert.middle   = [ ['white', 'mediumred'] ]
let s:p.replace.middle  = s:p.normal.middle
let s:p.replace.right   = s:p.normal.right
let s:p.tabline.left    = [ ['gray9', 'gray4'] ]
let s:p.tabline.tabsel  = [ ['gray5', 'gray10', 'bold'] ]
let s:p.tabline.middle  = [ ['gray7', 'gray2'] ]
let s:p.tabline.right   = [ ['gray9', 'gray3', 'bold'] ]
let s:p.normal.error    = [ ['gray9', 'brightestred'] ]
let s:p.normal.warning  = [ ['gray1', 'yellow'] ]

let g:lightline#colorscheme#freebsd#palette = lightline#colorscheme#fill(s:p)
