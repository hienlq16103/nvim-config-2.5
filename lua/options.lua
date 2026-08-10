require "nvchad.options"
-- add yours here!

local o = vim.o

o.shell = 'nu'
o.shellxquote = ''
o.shellcmdflag = '-c'
o.shellquote = ''
o.shellpipe = '| Out-File -Encoding UTF8 %s'
o.shellredir = '| Out-File -Encoding UTF8 %s'
o.winborder = 'rounded'

vim.wo.relativenumber = true

vim.g.health = { style = 'float' }
