-- init.lua

-- 1) Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable default mode display (we're using lualine)
vim.opt.showmode = false

-- 2) Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data')..'/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3) Detect OS theme
local function is_dark_mode()
  if vim.fn.has('macunix') == 1 then
    local ok, out = pcall(vim.fn.system, "defaults read -g AppleInterfaceStyle")
    return ok and out:match("Dark")
  elseif vim.fn.has('unix') == 1 then
    local ok, out = pcall(vim.fn.system,
      "gsettings get org.gnome.desktop.interface color-scheme")
    if ok then return out:lower():match("dark") end
  end
  return false
end

-- 4) Plugins
require('lazy').setup({
  -- theme “one”
  {
    'navarasu/onedark.nvim',
    lazy = false,
    config = function()
      require('onedark').setup {
        style = is_dark_mode() and 'darker' or 'light',
        transparent = false,
        code_style = { comments = 'italic', keywords = 'bold' },
      }
      require('onedark').load()
    end,
  },

  -- statusline integration using lualine (better onedark support)
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'navarasu/onedark.nvim' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'onedark',
          section_separators = '',
          component_separators = '',
        },
      }
    end,
  },

  -- coc.nvim for LSP/completion
  {
    'neoclide/coc.nvim',
    branch = 'release',
    event = 'BufReadPre',
    config = function()
      vim.cmd [[
        autocmd VimEnter * ++once
          \ silent! CocInstall -sync coc-rust-analyzer coc-pyright coc-tsserver coc-volar|q
      ]]

      -- Use Tab and Shift-Tab for completion navigation and Enter to confirm
      vim.api.nvim_set_keymap('i', '<Tab>',
        'coc#pum#visible() ? coc#pum#next(1) : coc#refresh()',
        {expr = true, silent = true})
      vim.api.nvim_set_keymap('i', '<S-Tab>',
        'coc#pum#visible() ? coc#pum#prev(1) : "\\<Tab>"',
        {expr = true, silent = true})
      vim.api.nvim_set_keymap('i', '<CR>',
        'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"',
        {expr = true, silent = true})

      -- Leader + g mappings
      local opts = {silent = true, noremap = true}
      vim.api.nvim_set_keymap('n', '<leader>gd', '<Plug>(coc-definition)', opts)
      vim.api.nvim_set_keymap('n', '<leader>gr', '<Plug>(coc-references)', opts)
      vim.api.nvim_set_keymap('n', '<leader>gi', '<Plug>(coc-implementation)', opts)
      vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', opts)
      vim.api.nvim_set_keymap('n', '<leader>ca', '<Plug>(coc-codeaction)', opts)
      vim.api.nvim_set_keymap('n', '<leader>dn', '<Plug>(coc-diagnostic-next)', opts)
      vim.api.nvim_set_keymap('n', '<leader>dp', '<Plug>(coc-diagnostic-prev)', opts)
      vim.api.nvim_set_keymap('n', '<S-K>', '<Plug>(coc-hover)', opts)
    end,
  },

  -- fuzzy finder + ripgrep
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = { 'plenary.nvim' },
    config = function()
      require('telescope').setup {
        defaults = {
          vimgrep_arguments = {
            'rg','--color=never','--no-heading','--with-filename',
            '--line-number','--column','--smart-case'
          },
          file_ignore_patterns = {'node_modules', '.git/'},
        }
      }
      local tmap = vim.api.nvim_set_keymap
      local opts = {noremap = true, silent = true}
      tmap('n','<leader>ff',"<cmd>Telescope find_files<cr>", opts)
      tmap('n','<leader>fg',"<cmd>Telescope live_grep<cr>", opts)
      tmap('n','<leader>fb',"<cmd>Telescope buffers<cr>", opts)
      tmap('n','<leader>fh',"<cmd>Telescope help_tags<cr>", opts)
    end,
  },

  -- yazi.nvim file explorer
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    dependencies = { 'folke/snacks.nvim' },
    keys = {
      { '<leader>-', mode = {'n','v'}, '<cmd>Yazi<cr>', desc = 'Open yazi at current file' },
      { '<leader>cw',           '<cmd>Yazi cwd<cr>', desc = 'Open yazi in cwd' },
      { '<c-up>',               '<cmd>Yazi toggle<cr>', desc = 'Resume last yazi session' },
    },
    opts = {
      open_for_directories = false,
      keymaps = { show_help = '<f1>' },
    },
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end,
  },

  -- mapping overlay
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('which-key').setup {}
    end,
  },
})

