if vim.fn.has 'linux' == 1 then
  return {}
end

return {
  'sphamba/smear-cursor.nvim',
  opts = {},
}
