local M = {}

function M.setup()
  M.buffer = vim.api.nvim_create_buf(true, false)
  vim.cmd("b" .. M.buffer)
  vim.cmd("terminal")

  vim.keymap.set("n", "<Leader>nt", function()
    if vim.fn.bufexists(M.buffer) == 0 then
      M.buffer = vim.api.nvim_create_buf(true, false)
      vim.cmd("sb" .. M.buffer)
      vim.cmd("terminal")
    else
      vim.cmd("sb " .. M.buffer)
    end
    vim.cmd("resize 10")
  end)
end

return M
