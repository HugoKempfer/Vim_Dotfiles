return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  dependencies = { 'folke/snacks.nvim' },
  keys = {
    { '<leader>-', mode = { 'n', 'v' }, '<cmd>Yazi<cr>', desc = 'Open yazi at current file' },
    { '<leader>cw', '<cmd>Yazi cwd<cr>', desc = 'Open yazi in cwd' },
    { '<c-up>', '<cmd>Yazi toggle<cr>', desc = 'Resume last yazi session' },
  },
  opts = {
    open_for_directories = false,
    keymaps = { show_help = '<f1>' },
  },
}
