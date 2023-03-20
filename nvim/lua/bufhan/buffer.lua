local buffer = {}

-- Create a scratch buffer with the name 0scratch.nvim.
-- When this buffer is crated it is put in the current window
function buffer.create_scratch_win()
    buffer.bufnr = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buffer.bufnr, "0scratch.nvim")
    vim.api.nvim_win_set_buf(0, buffer.bufnr)
end

return buffer
