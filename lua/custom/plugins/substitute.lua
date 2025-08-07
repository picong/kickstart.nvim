return {
  'gbprod/substitute.nvim',
  opts = {
    -- your your comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    require('substitute').setup {
      vim.keymap.set('n', 'gs', require('substitute').operator, { desc = 'substitute operation', noremap = true }),
      vim.keymap.set('n', 'gss', require('substitute').line, { desc = 'substitute line', noremap = true }),
      vim.keymap.set('n', 'gS', require('substitute').eol, { desc = 'substitute eol', noremap = true }),
      vim.keymap.set('x', 'gs', require('substitute').visual, { desc = 'substitute visual', noremap = true }),
    }
  end,
}
