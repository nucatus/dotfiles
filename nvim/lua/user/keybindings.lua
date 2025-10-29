-- Make Space the <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- FZF-Lua Keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>lua require('fzf-lua').help_tags()<CR>", { desc = "Help Tags" })
