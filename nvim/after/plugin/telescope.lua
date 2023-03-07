local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})

-- use the live_grep_args instead of the live_grep. This is 
-- a plugin that falls back to ripgrep and allows more filters
-- vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ps', require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })

-- thic config is doing the same as the one above
-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({ search = vim.fn.input("Grep >") });
-- end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})


vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Use the native implementation of fzf. This requires the
-- `nvim-telescope/telescope-fzf-native.nvim` plugin.
require('telescope').load_extension('fzf')
