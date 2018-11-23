" ------------------------------ python.vim ----------------------------------
"
" Settings that only apply when editing python files.

setlocal textwidth=88

augroup python
    autocmd!
    autocmd BufWritePre *.py execute ':Black'
augroup END
