
"function! SearchInRange(pattern, start_line, end_line)
"    " Save cursor position.
"    let last_cursor_position = getcurpos()
"
"    " Set cursor position to beginning of file.
"    call cursor(a:start_line, 0)
"
"    " Search for the string 'hello' with a flag c.  The c flag means that a
"    " match at the cursor position will be accepted.
"    let search_result = search(pattern, "c", a:end_line)
"
"    " Set the cursor back at the saved position.  The setpos function was
"    " used here because the return value of getcurpos can be used directly
"    " with it, unlike the cursor function.
"    call setpos('.', last_cursor_position)
"
"    " If the search function didn't find the pattern, it will have
"    " returned 0, thus it wasn't found.  Any other number means that an instance
"    " has been found.
"    return search_result ? 1 : 0
"endfunction
"

function! UpdateHeaderCopyright()
  let last_cursor_position = getcurpos()
  silent! :1,3s/-20[01][0-9]/-2018/
  call setpos('.', last_cursor_position)
endfunction

" call UpdateHeaderCopyright()

