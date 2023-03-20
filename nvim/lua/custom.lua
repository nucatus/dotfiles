-- this is my custom tailored tools where I write my own
-- functions or initialize them

-- Crate the user command that will create a Scratch window.
-- This command can then be attached to a key binding
vim.api.nvim_create_user_command('Scratch', function ()
        require('bufhan.buffer').create_scratch_win()
    end,
    {})
