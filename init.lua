-- init.lua

-- 1) Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable default mode display (we're using lualine)
vim.opt.showmode = false

-- 2) Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
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
      -- Names of the LSP servers attached to the current buffer
      local function lsp_clients()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if #clients == 0 then return '' end
        local names = {}
        for _, client in ipairs(clients) do
          table.insert(names, client.name)
        end
        return ' ' .. table.concat(names, ',')
      end

      -- Live language-server progress text (indexing, loading, ...) from $/progress
      local function lsp_progress()
        return vim.lsp.status()
      end

      require('lualine').setup {
        options = {
          theme = 'onedark',
          section_separators = '',
          component_separators = '',
        },
        sections = {
          lualine_c = {
            'filename',
            { 'diagnostics', sources = { 'nvim_diagnostic' } },
          },
          lualine_x = {
            { lsp_progress, color = { gui = 'italic' } },
            { lsp_clients },
            'encoding',
            'fileformat',
            'filetype',
          },
        },
      }

      -- Redraw the statusline as LSP progress updates come in
      vim.api.nvim_create_autocmd('LspProgress', {
        callback = function() vim.cmd('redrawstatus') end,
      })
    end,
  },

  -- Mason: install/manage language servers
  {
    'mason-org/mason.nvim',
    cmd = 'Mason',
    config = function()
      require('mason').setup()
    end,
  },

  -- Native LSP client configuration (Neovim 0.11+ vim.lsp.config/enable flow)
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
      'saghen/blink.cmp',
    },
    config = function()
      -- Advertise blink.cmp's completion capabilities to every server
      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      -- Install these servers and auto-enable any installed ones.
      -- Add languages here, or install on the fly with :Mason.
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls' },
        automatic_enable = true,
      }

      -- Diagnostics presentation
      vim.diagnostic.config {
        virtual_text = true,
        severity_sort = true,
        float = { border = 'rounded' },
      }

      -- Buffer-local mappings on attach (mirrors the old coc bindings)
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local function map(lhs, rhs, desc)
            vim.keymap.set('n', lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
          end
          -- Goto (g-prefix, mirroring Vim's built-in goto motions)
          map('gd', vim.lsp.buf.definition, 'Goto definition')
          map('gr', vim.lsp.buf.references, 'Goto references')
          map('gI', vim.lsp.buf.implementation, 'Goto implementation')
          map('K', vim.lsp.buf.hover, 'Hover docs')
          -- Code (<leader>c)
          map('<leader>cr', vim.lsp.buf.rename, 'Rename')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
          -- Diagnostics (]/[ to jump, <leader>c for the rest)
          map(']d', function() vim.diagnostic.jump({ count = 1 }) end, 'Next diagnostic')
          map('[d', function() vim.diagnostic.jump({ count = -1 }) end, 'Prev diagnostic')
          map('<leader>cd', vim.diagnostic.open_float, 'Diagnostic float')
          map('<leader>cq', vim.diagnostic.setqflist, 'Diagnostics to quickfix')
        end,
      })
    end,
  },

  -- Completion engine (replaces coc's built-in completion)
  {
    'saghen/blink.cmp',
    version = '*',
    event = 'InsertEnter',
    opts = {
      -- Enter to confirm; Tab/S-Tab to move through the menu (like the old coc keys)
      keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
      },
      completion = {
        documentation = { auto_show = true },
      },
      signature = { enabled = true },
    },
  },

  -- Lua LS enhancements for editing this Neovim config
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {},
  },

  -- fuzzy finder + ripgrep
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = { 'plenary.nvim' },
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Find via grep' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Find help' },
      { '<leader>fd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Find diagnostics' },
    },
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
    end,
  },

  -- yazi.nvim file explorer
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    dependencies = { 'folke/snacks.nvim' },
    keys = {
      { '<leader>e', mode = { 'n', 'v' }, '<cmd>Yazi<cr>',        desc = 'Explorer (current file)' },
      { '<leader>E',                      '<cmd>Yazi cwd<cr>',    desc = 'Explorer (cwd)' },
      { '<c-up>',                         '<cmd>Yazi toggle<cr>', desc = 'Resume last yazi session' },
    },
    opts = {
      open_for_directories = false,
      keymaps = { show_help = '<f1>' },
    },
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end,
  },

  -- auto-close brackets, parens, and quotes
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },

  -- mapping overlay
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require('which-key')
      wk.setup {}
      wk.add {
        { '<leader>c', group = 'Code' },
        { '<leader>f', group = 'Find' },
        { '<leader>e', desc = 'Explorer (current file)' },
        { '<leader>E', desc = 'Explorer (cwd)' },
      }
    end,
  },
})

