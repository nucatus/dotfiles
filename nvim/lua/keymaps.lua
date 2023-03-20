local keymap = vim.api.nvim_set_keymap
local def_opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- open the file explorer

keymap('n', 'x', '"_x', def_opts) -- do not yank with 'x'
keymap('n', 'dw', 'vb"_d', def_opts) -- delete a word backwords

keymap('n', 'J', 'mzJ`z', def_opts) -- append the next line while keeping the curson on position
keymap('v', 'J', ":m '>+4<CR>gv=gv", def_opts) -- move selection vertically
keymap('v', 'K', ":m '<1<CR>gv=gv", def_opts)

keymap('n', '<C-d>', '<C-d>zz', def_opts) -- keep scroll safe margin while scrolling
keymap('n', '<C-u>', '<C-u>zz', def_opts)
keymap('n', 'n', 'nzzzv', def_opts) -- keep currsor in the middle while prcessing search results
keymap('n', 'N', 'Nzzzv', def_opts)

keymap('n', '<C-a>', 'gg<S-v>G', def_opts) -- select all

-- Tab/window management
keymap('n', 'te', ':tabedit<Return>', def_opts)
keymap('n', 'ss', ':split<Return><C-w>w', def_opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', def_opts)

keymap('n', '<leader>w', '<C-w>w', def_opts)
keymap('',  'aj', '<C-w>j', def_opts)
keymap('',  'ak', '<C-w>k', def_opts)
keymap('',  'ah', '<C-w>h', def_opts)
keymap('',  'al', '<C-w>l', def_opts)

-- start a plain scratch that is used only for notes
keymap('n', '<leader>s', ':Scratch<Return>', def_opts)
