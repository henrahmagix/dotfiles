" Status Line ------------------------------------------------------------ {{{

set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\ \  " Space.

set statusline+=%#warningmsg#                " Highlight the following as a warning.
"set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
set statusline+=%*                           " Reset highlighting.

set statusline+=%=   " Right align.

" Line and column position and counts.
set statusline+=\ (%L)\ %03l,%03c

set statusline+=\ \  " Space.

" Git
"set statusline+=%{fugitive#statusline()}

set statusline+=\ \  " Space.

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).

set statusline+=\ \  " Space.

" Show line numbers
set number

" Remove ruler and set statusline
set noruler
set laststatus=2
