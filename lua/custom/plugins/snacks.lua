return {
  'folke/snacks.nvim',
  enabled = false,
  lazy = false,
  config = function()
    require 'custom.config.snacks'

    local map = function(key, func, desc)
      vim.keymap.set('n', key, func, { desc = desc })
    end

    -- all keymaps for snacks.picker
    map('<leader>sf', Snacks.picker.smart, 'Smart find file')
    map('<leader>so', Snacks.picker.recent, 'Find recent file')
    map('<leader>sw', Snacks.picker.grep, 'Find content')
    map('<leader>sh', function()
      Snacks.picker.help { layout = 'dropdown' }
    end, 'Find in help')
    map('<leader>sl', Snacks.picker.picker_layouts, 'Find picker layout')
    map('<leader>sk', function()
      Snacks.picker.keymaps { layout = 'dropdown' }
    end, 'Find keymap')
    map('<leader><leader>', function()
      Snacks.picker.buffers { sort_lastused = true }
    end, 'Find buffers')
    map('<leader>sm', Snacks.picker.marks, 'Find mark')
    map('<leader>sn', function()
      Snacks.picker.notifications { layout = 'dropdown' }
    end, 'Find notification')
    map('grr', Snacks.picker.lsp_references, 'Find lsp references')
    map('<leader>ss', Snacks.picker.lsp_workspace_symbols, 'Find workspace symbol')
    map('<leader>ss', function()
      local bufnr = vim.api.nvim_get_current_buf()
      local clients = vim.lsp.get_clients { bufnr = bufnr }

      local function has_lsp_symbols()
        for _, client in ipairs(clients) do
          if client.server_capabilities.documentSymbolProvider then
            return true
          end
        end
        return false
      end

      local picker_opts = {
        layout = 'right',
        tree = true,
        -- on_show = function()
        --   vim.cmd.stopinsert()
        -- end,
      }
      if has_lsp_symbols() then
        Snacks.picker.lsp_symbols(picker_opts)
      else
        Snacks.picker.treesitter()
      end
    end, 'Find symbol in current buffer')
    map('<leader>si', Snacks.picker.icons, 'Find icon')
    map('<leader>sb', Snacks.picker.lines, 'Find lines in current buffer')
    map('<leader>sd', Snacks.picker.diagnostics, 'Find diagnostic')
    map('<leader>sH', Snacks.picker.highlights, 'Find highlight')
    map('<leader>sc', function()
      Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
    end, 'Find nvim config file')
    map('<leader>s/', Snacks.picker.search_history, 'Find search history')
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
