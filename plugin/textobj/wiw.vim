"=============================================================================
" textobj-wiw - Text object to select a range of words for humans.
"
" File    : plugin/textobj/wiw.vim
" Author  : h1mesuke <himesuke@gmail.com>
" Updated : 2012-01-09
" Version : 0.0.1
" License : MIT license {{{
"
"   Permission is hereby granted, free of charge, to any person obtaining
"   a copy of this software and associated documentation files (the
"   "Software"), to deal in the Software without restriction, including
"   without limitation the rights to use, copy, modify, merge, publish,
"   distribute, sublicense, and/or sell copies of the Software, and to
"   permit persons to whom the Software is furnished to do so, subject to
"   the following conditions:
"
"   The above copyright notice and this permission notice shall be included
"   in all copies or substantial portions of the Software.
"
"   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"   CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

if exists('g:loaded_textobj_wiw') && g:loaded_textobj_wiw
  finish
endif
let g:loaded_textobj_wiw = 1

let s:save_cpo = &cpo
set cpo&vim

let s:prefix = get(g:, 'textobj_wiw_default_key_mappings_prefix', ',')

" Key-mappings
call textobj#user#plugin('wiw', {
      \ '-': {
      \   '*pattern*': 'DUMMY',
      \   'move-n'   : s:prefix . 'w',  '*move-n-function*': 'textobj#wiw#move_w',
      \   'move-p'   : s:prefix . 'b',  '*move-p-function*': 'textobj#wiw#move_b',
      \   'move-N'   : s:prefix . 'e',  '*move-N-function*': 'textobj#wiw#move_e',
      \   'move-P'   : s:prefix . 'ge', '*move-P-function*': 'textobj#wiw#move_ge',
      \
      \   '*sfile*'  : expand('<sfile>:p'),
      \   'select-a' : 'a' . s:prefix . 'w', '*select-a-function*': 'textobj#wiw#select_a',
      \   'select-i' : 'i' . s:prefix . 'w', '*select-i-function*': 'textobj#wiw#select_i',
      \ }
      \})
unlet s:prefix

" Override move function to share s:move() with s:select().
function! g:__textobj_wiw.move(...)
  call call('textobj#wiw#move', a:000)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
