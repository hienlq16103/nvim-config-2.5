" Match the commit hash (exactly 10 hex chars)
syn match gitHash '\<[a-f0-9]\{10\}\>' nextgroup=gitRef skipwhite

" Match refs in parentheses after the hash
syn region gitRef start='(' end=')' contained contains=gitLocalRef,gitOriginRef,gitHead

" Color local refs (branch names that don't start with origin/)
syn match gitLocalRef '[a-zA-Z0-9_][a-zA-Z0-9_./-]*' contained

" Color origin refs
syn match gitOriginRef 'origin/[a-zA-Z0-9_./-]*' contained

" Color HEAD
syn match gitHead 'HEAD ->' contained

" Color the author/time section
syn match gitAuthor '\[[^\]]*\]'

" Highlight groups
highlight link gitRef Identifier
highlight link gitHead Number
highlight link gitOriginRef Keyword
highlight link gitLocalRef String
highlight link gitAuthor Comment
