-- Make Space the <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- FZF-Lua Keymaps
vim.keymap.set("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>g", "<cmd>lua require('fzf-lua').live_grep()<CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>", { desc = "Buffers" })

-- buffer navigation
vim.keymap.set("n", "<Tab>", vim.cmd.bnext, { silent = true })
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprev, { silent = true })
vim.keymap.set("n", "<leader>q", vim.cmd.bdelete, { silent = true })

-- vim.rc - create a new tab, change the cwd in the context of that tab, edit key bindings
vim.keymap.set("n", "<leader>rr", function()
    vim.cmd("tabnew")
    vim.cmd("tcd ~/.config/nvim")
    vim.cmd("edit lua/user/keybindings.lua")
end, { silent = true })

vim.keymap.set("n", "<leader>rc", function()
    vim.cmd("source $MYVIMRC")
    print("Neovim configuration reloaded")
end, { silent = true })
