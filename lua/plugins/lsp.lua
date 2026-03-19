return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'b0o/SchemaStore.nvim',
    },
    config = function()
      -- Mason setup (must come before lspconfig)
      require('mason').setup()
      require('mason-tool-installer').setup {
        ensure_installed = {
          'black',
          'prettier',
          'stylua',
        },
      }

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- LSP keymaps on attach
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp_attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
          end

          -- Navigation (no prefix)
          map('gd', vim.lsp.buf.definition, 'Go to definition')
          map('gr', vim.lsp.buf.references, 'Go to references')
          map('gi', vim.lsp.buf.implementation, 'Go to implementation')
          map('K', vim.lsp.buf.hover, 'Hover documentation')

          -- LSP group (<leader>l)
          map('<leader>la', vim.lsp.buf.code_action, 'Code action')
          map('<leader>lr', vim.lsp.buf.rename, 'Rename')
          map('<leader>ls', vim.lsp.buf.signature_help, 'Signature help')
          map('<leader>lt', vim.lsp.buf.type_definition, 'Type definition')
          map('<leader>lf', function() vim.lsp.buf.format { async = true } end, 'Format')
        end,
      })

      -- Server configurations
      local lspconfig = require('lspconfig')

      local servers = {
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              checkOnSave = { command = 'clippy' },
              cargo = { allFeatures = true },
            },
          },
        },
        pyright = {},
        ts_ls = {},
        volar = {
          init_options = {
            vue = { hybridMode = false },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemaStore = { enable = false, url = '' },
              schemas = require('schemastore').yaml.schemas(),
            },
          },
        },
        taplo = {},
        jsonls = {
          settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true },
            },
          },
        },
        dockerls = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
              },
            },
          },
        },
      }

      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            local config = servers[server_name] or {}
            config.capabilities = capabilities
            lspconfig[server_name].setup(config)
          end,
        },
      }
    end,
  },
}
