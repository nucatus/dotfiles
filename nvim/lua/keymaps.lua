local keymap = vim.keymap

vim.g.mapleader = ' '

-- Open the file explorer
keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Delete a word backwords
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Tab/window management
keymap.set('n', 'te', ':tabedit<Return>', {silent = true})
keymap.set('n', 'ss', ':split<Return><C-w>w', {silent = true})
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', {silent = true})

keymap.set('n', '<Space>', '<C-w>w')
keymap.set('',  'aj', '<C-w>j')
keymap.set('',  'ak', '<C-w>k')
keymap.set('',  'ah', '<C-w>h')
keymap.set('',  'al', '<C-w>l')


-- Exrta commands
keymap.set('n', '<leader><leader>', function()
    vim.cmd('so')
end)
