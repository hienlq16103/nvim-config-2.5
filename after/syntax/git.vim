" Color the entire ref section (parentheses and content)
syn match gitRef '([^)]*)'

" Color local refs (branch names that don't start with origin/)
syn match gitLocalRef '[a-zA-Z0-9_][a-zA-Z0-9_/-]*' contained containedin=gitRef

" Color origin refs (e.g., origin/main, origin/feature)
syn match gitOriginRef 'origin/[a-zA-Z0-9_/-]*' contained containedin=gitRef

" Color HEAD -> specifically within the refs
syn match gitHead 'HEAD ->' contained containedin=gitRef

" Color the author/time section in cyan
syn match gitAuthor '\[[^\]]*\]'

" Define highlight groups
highlight link gitRef Identifier
highlight link gitHead Number
highlight link gitOriginRef Keyword
highlight link gitLocalRef String
highlight link gitAuthor Special
