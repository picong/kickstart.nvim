return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {--[[ things you want to change go here]]
    },
    config = function()
      require('toggleterm').setup {
        -- 全局配置
        shell = vim.fn.executable 'pwsh' == 1 and 'pwsh' or 'powershell', -- 宿主 Shell
        direction = 'float', -- 浮动窗口
        float_opts = {
          border = 'curved', -- 窗口边框样式
        },
        -- 为 NuShell 创建专用终端
        open_mapping = [[<c-\>]], -- 打开/关闭终端的快捷键 (Ctrl+\)
        shade_terminals = false, -- 禁用背景遮罩

        -- 自定义终端定义
        execs = {
          {
            name = 'NuShell', -- 终端名称
            cmd = 'nu', -- 直接调用系统 PATH 中的 nu
            keymap = '<leader>tn', -- 专属快捷键 (默认为 <leader>tg)
          },
        },
      }
    end,
  },
}
