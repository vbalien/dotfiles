" Prettier for Lua
function PrettierLuaCursor()
  let save_pos = getpos(".")
  %! prettier --stdin-filepath buffer.lua --parser=lua
  call setpos('.', save_pos)
endfunction
" define custom command
command PrettierLua call PrettierLuaCursor()
" format on save
autocmd BufwritePre *.lua PrettierLua
