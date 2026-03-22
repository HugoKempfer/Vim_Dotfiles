return {
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
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {
          {
            function()
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              if #clients == 0 then return '' end
              local names = {}
              for _, client in ipairs(clients) do
                table.insert(names, client.name)
              end
              return ' ' .. table.concat(names, ', ')
            end,
            cond = function() return #vim.lsp.get_clients({ bufnr = 0 }) > 0 end,
          },
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
