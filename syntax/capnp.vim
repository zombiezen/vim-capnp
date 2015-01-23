" Vim syntax file
" Language: capnp
" Maintainer: Charles Strahan

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword capnpDeclaration struct union enum interface annotation const
syn keyword capnpKeyword using extends
syn match capnpArrow /->/

" Types
syn match capnpType ":[.a-zA-Z0-9()]\+"
" Imports
syn region capnpImport start=/import\s*"/ skip=/\\"/ end=/"/


" Comments
syn match capnpComment "#.*$" contains=@Spell

" Ordinals
syn match capnpOrdinal "@[0-9]\+"

" File IDs
syn match capnpFileId "@0x[a-fA-F0-9]\+"

" Annotations
syn region capnpAnnotation start=/\$/ end=/[;()\n]/re=s-1,he=s-1 oneline contains=capnpImport

" Braces
syn region capnpFold matchgroup=capnpBraces start="{" end="}" transparent fold

" Literals
syn region capnpString start=/"/ skip=/\\"/ end=/"/

" Highlighting
hi link capnpComment      Comment
hi link capnpImport       Include
hi link capnpDeclaration  Structure
hi link capnpKeyword      Keyword
hi link capnpArrow        Operator
hi link capnpString       String
hi link capnpType         Type
hi link capnpOrdinal      Identifier
hi link capnpFileId       Identifier
hi link capnpAnnotation   Statement

let b:current_syntax = "capnp"
