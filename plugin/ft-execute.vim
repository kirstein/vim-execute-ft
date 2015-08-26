function! ExecuteByFT(type)
  if empty(&filetype) | return | endif
  if !exists('g:execute_ft_commands') | return | endif

  " Handles the case of curious filetypes
  " such as javascript.jsx
  let l:ft   = split(&filetype, "\\.")[0]
  let l:cmds = get(g:execute_ft_commands, l:ft)

  if empty(l:cmds) | return | endif
  let l:cmd = get(l:cmds, a:type)

  if !empty(l:cmd)
    exec(l:cmd)
  endif
endfunction
