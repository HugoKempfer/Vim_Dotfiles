-- Detect OS dark/light mode
local function is_dark_mode()
  if vim.fn.has('macunix') == 1 then
    local ok, out = pcall(vim.fn.system, 'defaults read -g AppleInterfaceStyle')
    return ok and out:match('Dark')
  elseif vim.fn.has('unix') == 1 then
    local ok, out = pcall(vim.fn.system,
      'gsettings get org.gnome.desktop.interface color-scheme')
    if ok then return out:lower():match('dark') end
  end
  return false
end

return {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('onedark').setup {
      style = is_dark_mode() and 'darker' or 'light',
      transparent = false,
      code_style = { comments = 'italic', keywords = 'bold' },
    }
    require('onedark').load()
  end,
}
