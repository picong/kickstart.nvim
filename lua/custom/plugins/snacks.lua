return {
  'folke/snacks.nvim',
  lazy = false,
  config = function()
    require 'custom.config.snacks'

    local map = function(key, func, desc)
      vim.keymap.set('n', key, func, { desc = desc })
    end

    -- all keymaps for snacks.picker
    map('<leader>s.', Snacks.picker.recent, '[S]earch Recent Files ("." for repeat)')
    map('<leader>sl', Snacks.picker.picker_layouts, 'Find picker layout')
    map('<leader>sm', Snacks.picker.marks, 'Find mark')
    map('<leader>sn', function()
      Snacks.picker.notifications { layout = 'dropdown' }
    end, 'Find notification')
    map('grr', Snacks.picker.lsp_references, 'Find lsp references')
    map('<leader>si', Snacks.picker.icons, 'Find icon')
    map('<leader>sb', Snacks.picker.lines, 'Find lines in current buffer')
    map('<leader>sd', Snacks.picker.diagnostics, 'Find diagnostic')
    map('<leader>sH', Snacks.picker.highlights, 'Find highlight')
    map('<leader>sj', Snacks.picker.jumps, 'Find jump')
    map('<leader>st', function()
      if vim.bo.filetype == 'markdown' then
        Snacks.picker.grep_buffers {
          finder = 'grep',
          format = 'file',
          prompt = ' ',
          search = '^\\s*- \\[ \\]',
          regex = true,
          live = false,
          args = { '--no-ignore' },
          on_show = function()
            vim.cmd.stopinsert()
          end,
          buffers = false,
          supports_live = false,
          layout = 'ivy',
        }
      else
        Snacks.picker.todo_comments { keywords = { 'TODO', 'FIX', 'FIXME', 'HACK' }, layout = 'select' }
      end
    end, 'Find todo')

    -- other snacks features
    map('<leader>bc', Snacks.bufdelete.delete, 'Delete buffers')
    map('<leader>bC', Snacks.bufdelete.other, 'Delete other buffers')
    map('<leader>gg', function()
      Snacks.lazygit { cwd = Snacks.git.get_root() }
    end, 'Open lazygit')
    map('<leader>n', Snacks.notifier.show_history, 'Notification history')
  end,
}
