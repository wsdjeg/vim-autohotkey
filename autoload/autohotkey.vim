let s:complete_dict = {
            \ 'AutoTrim' :
            \ "AutoTrim, On|Off\nDetermines whether <a href=\"SetEnv.htm\">Var1 = %Var2%</a> statements omit spaces and tabs from the beginning and end of Var2.",
            \ 'Blocks' :
            \ "{\nzero or more commands\n}\nA pair of braces denotes a block. Blocks are typically used with functions, Else, Loop, While-loop, and IF-commands.",
            \ }

function! autohotkey#complete(findstart, base) abort

    if a:findstart
        let line = getline('.')
        let idx = col('.') - 1
        let hasleftbrace = 0
        while idx > 0
            let idx -= 1
            let c = line[idx]
            if c =~ '\v[a-zA-Z0-9]'
                continue
            elseif c == "#"
                return idx
            else
                return idx+1
            endif
        endwhile
        return 0
    else
        let g:ahk_complete_dict = []
        let base = tolower(a:base)
        for [k, v] in items(s:complete_dict)
            call add(g:ahk_complete_dict, {'word': k, 'info': v, 'icase':1})
        endfor
        return sort(g:ahk_complete_dict)
    endif
endfunction
