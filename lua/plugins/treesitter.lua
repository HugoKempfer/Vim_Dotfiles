return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    opts = {
      ensure_installed = {
        'bash', 'c', 'css', 'dockerfile', 'html', 'javascript',
        'json', 'lua', 'markdown', 'markdown_inline', 'python',
        'rust', 'toml', 'tsx', 'typescript', 'vim', 'vimdoc',
        'vue', 'yaml',
      },
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = { query = '@function.outer', desc = 'Around function' },
            ['if'] = { query = '@function.inner', desc = 'Inside function' },
            ['ac'] = { query = '@class.outer', desc = 'Around class' },
            ['ic'] = { query = '@class.inner', desc = 'Inside class' },
            ['aa'] = { query = '@parameter.outer', desc = 'Around argument' },
            ['ia'] = { query = '@parameter.inner', desc = 'Inside argument' },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = { query = '@function.outer', desc = 'Next function start' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@function.outer', desc = 'Previous function start' },
          },
        },
      },
    },
  },
}
