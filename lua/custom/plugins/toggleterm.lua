return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {--[[ things you want to change go here]]
    },
    config = function()
      if vim.fn.has 'linux' == 1 then
        -- 在 ~/.config/nvim/init.lua 或 lua/config/toggleterm.lua 中添加
        require('toggleterm').setup {

          -- 打开终端时是否自动进入插入模式
          open_mapping = [[<c-\>]],

          -- 终端方向: 'horizontal' | 'vertical' | 'tab' | 'float'
          direction = 'float',

          -- 是否在打开终端时隐藏号码列
          hide_numbers = true,

          -- 终端窗口的阴影
          shade_terminals = true,

          -- 终端启动时所在的目录
          -- 可以是字符串或函数返回路径
          start_in_insert = true,

          -- 插入模式映射
          insert_mappings = true,

          -- 终端窗口是否显示行号
          persist_size = true,

          -- 关闭终端时是否关闭窗口
          close_on_exit = true,

          -- 高亮组
          highlights = {
            Normal = {
              guibg = 'NONE',
            },
            NormalFloat = {
              link = 'Normal',
            },
            FloatBorder = {
              guifg = '#3b4261',
              guibg = 'NONE',
            },
          },

          -- 浮动窗口配置
          float_opts = {
            border = 'curved',
            width = function()
              return math.floor(vim.o.columns * 0.8)
            end,
            height = function()
              return math.floor(vim.o.lines * 0.8)
            end,
            winblend = 3,
          },

          -- 终端窗口的自动命令
          on_open = function(term)
            -- 终端打开时禁用行号
            vim.cmd 'setlocal nonumber norelativenumber'
          end,
        }
      else
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
      end
    end,
  },
}
