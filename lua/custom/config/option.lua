vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = { '*' },
  callback = function()
    local input_status = tonumber(vim.fn.system 'D:\\tools\\im-select.exe')
    if input_status == 2052 then
      vim.fn.system 'im-select.exe 1033'
    end
  end,
})
