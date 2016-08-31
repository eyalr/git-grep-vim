let g:gitgrepprg="git\\ grep\\ -n"

function! GitGrep(args)
    if empty(a:args)
      let l:grepargs = expand("<cword>")
    else
      let l:grepargs = '"' . a:args . join(a:000, ' ') . '"'
    end
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! grep " . l:grepargs
    botright copen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

function! GitGrepPython(args)
    if empty(a:args)
      let l:grepargs = expand("<cword>")
    else
      let l:grepargs = '"' . a:args . join(a:000, ' ') . '"'
    end
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! grep " . l:grepargs . " -- '*.py'"
    botright copen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

function! GitGrepJavaScript(args)
    if empty(a:args)
      let l:grepargs = expand("<cword>")
    else
      let l:grepargs = '"' . a:args . join(a:000, ' ') . '"'
    end
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! grep " . l:grepargs . " -- '*.js'"
    botright copen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

function! GitGrepHTML(args)
    if empty(a:args)
      let l:grepargs = expand("<cword>")
    else
      let l:grepargs = '"' . a:args . join(a:000, ' ') . '"'
    end
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! grep " . l:grepargs . " -- '*.html'"
    botright copen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

function! GitGrepAdd(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! grepadd " . a:args
    botright copen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

function! LGitGrep(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! lgrep " . a:args
    botright lopen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

function! LGitGrepAdd(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! lgrepadd " . a:args
    botright lopen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

command! -nargs=* -complete=file GitGrep call GitGrep(<q-args>)
command! -nargs=* -complete=file GitGrepAdd call GitGrepAdd(<q-args>)
command! -nargs=* -complete=file LGitGrep call LGitGrep(<q-args>)
command! -nargs=* -complete=file LGitGrepAdd call LGitGrepAdd(<q-args>)

autocmd bufenter * if (winnr("$") == 1 && exists("b:GitGrepWindow")) | q | endif
