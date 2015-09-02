"
" Execute the last executed command
" Awesome.
"
function! ExecuteByFtLast()
  if exists('s:cmd')
    exec(s:cmd)
  endif
endfunction

" 
" Execute the command by filetype
"
function! ExecuteByFT(type)
  if empty(&filetype) | return | endif
  if !exists('g:execute_ft_commands') | return | endif

  " handles the case of curious filetypes
  " such as javascript.jsx
  let l:ft   = split(&filetype, "\\.")[0]
  let l:cmds = get(g:execute_ft_commands, l:ft)

  if empty(l:cmds) | return | endif
  let l:cmd = get(l:cmds, a:type)

  if !empty(l:cmd)
    " substitute all `{file}` statements to file fullpath
    let s:cmd = substitute(l:cmd, "{file}", expand("%:p"), "g")
    exec(s:cmd)
  endif
endfunction
