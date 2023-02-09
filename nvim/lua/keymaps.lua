local keymap = vim.keymap

vim.g.mapleader = ' '

keymap.set('n', '<leader>pv', vim.cmd.Ex) -- open the file explorer

keymap.set('n', 'x', '"_x') -- do not yank with 'x'
keymap.set('n', 'dw', 'vb"_d') -- delete a word backwords

keymap.set('n', 'J', 'mzJ`z') -- append the next line while keeping the curson on position
keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- move selection vertically
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

keymap.set('n', '<C-d>', '<C-d>zz') -- keep scroll safe margin while scrolling
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv') -- keep currsor in the middle while prcessing search results
keymap.set('n', 'N', 'Nzzzv')

keymap.set('n', '<C-a>', 'gg<S-v>G') -- select all

-- Tab/window management
keymap.set('n', 'te', ':tabedit<Return>', {silent = true})
keymap.set('n', 'ss', ':split<Return><C-w>w', {silent = true})
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', {silent = true})

keymap.set('n', '<Space>', '<C-w>w')
keymap.set('',  'aj', '<C-w>j')
keymap.set('',  'ak', '<C-w>k')
keymap.set('',  'ah', '<C-w>h')
keymap.set('',  'al', '<C-w>l')


