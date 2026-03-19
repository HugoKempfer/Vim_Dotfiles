return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require('which-key')
    wk.setup {}
    wk.add {
      { '<leader>f', group = 'Find' },
      { '<leader>g', group = 'Git' },
      { '<leader>l', group = 'LSP' },
      { '<leader>d', group = 'Debug' },
      { '<leader>b', group = 'Buffer' },
      { '<leader>a', group = 'AI' },
    }
  end,
}
