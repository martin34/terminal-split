local M = {}

function M.split_terminal()
  if vim.fn.bufexists(M.buffer) == 0 then
    M.buffer = vim.api.nvim_create_buf(true, false)
    vim.cmd("sb" .. M.buffer)
    vim.cmd("terminal")
  else
    vim.cmd("sb " .. M.buffer)
  end
  vim.cmd("resize 10")
end

function M.full_terminal()
  if vim.fn.bufexists(M.buffer) == 0 then
    M.buffer = vim.api.nvim_create_buf(true, false)
    vim.cmd("b" .. M.buffer)
    vim.cmd("terminal")
  else
    vim.cmd("b " .. M.buffer)
  end
end

function M.setup()
  vim.keymap.set("n", "<Leader>c", function()
    M.split_terminal()
  end)
  vim.keymap.set("n", "<Leader>C", function()
    M.full_terminal()
  end)
end

return M
