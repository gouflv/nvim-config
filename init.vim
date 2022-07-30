let s:core_files = [
            \ 'options.vim',
            \ 'autocmd.vim',
            \ 'mappings.vim',
            \ 'plugins.vim',
            \ 'themes.vim',
            \ ]

for s:name in s:core_files
    execute printf('source %s/core/%s', stdpath('config'), s:name)
endfor
