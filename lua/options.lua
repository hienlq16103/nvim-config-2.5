require "nvchad.options"
-- add yours here!

local o = vim.o

o.shell = 'pwsh'
o.shellxquote = ''
o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
o.shellquote = ''
o.shellpipe = '| Out-File -Encoding UTF8 %s'
o.shellredir = '| Out-File -Encoding UTF8 %s'
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.wo.relativenumber = true
