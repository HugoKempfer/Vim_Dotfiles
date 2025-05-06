# Neovim Configuration (Lua)

This repository provides a modern Neovim configuration with lazy-loaded plugins, dynamic theming, built-in LSP support via CoC, fuzzy finding, and a TUI file explorer. Written in Lua and managed by `folke/lazy.nvim`.

---

## Features

* **Lazy-loaded plugins** with [`lazy.nvim`](https://github.com/folke/lazy.nvim)
* **One Dark** theme with automatic light/dark switching based on macOS & GNOME settings
* **Statusline** via [`lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim) using the `onedark` theme
* **LSP & completion** powered by [`coc.nvim`](https://github.com/neoclide/coc.nvim) with preconfigured servers for Rust, Python, TypeScript, and Vue
* **Fuzzy finding** and live grep via [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) backed by \[ripgrep]
* **File explorer** using [`yazi.nvim`](https://github.com/mikavilpas/yazi.nvim) with TUI interface from `snacks.nvim`
* **Keybinding hints** overlay through [`which-key.nvim`](https://github.com/folke/which-key.nvim)
* **Custom mappings** with `<Space>` leader for all CoC actions and Telescope commands

---

## Prerequisites

* **Neovim** >= 0.8
* **Node.js** (for `coc.nvim`)
* **ripgrep** (for Telescope)
* **gsettings** (on Linux) for theme detection
* **Football** plugin manager (`lazy.nvim` bootstraps itself)

---

## Installation

1. Clone this repo to your Neovim config directory:

   ```sh
   git clone <this-repo> ~/.config/nvim
   ```
2. Open Neovim:

   ```sh
   nvim
   ```
3. `lazy.nvim` will auto-install missing plugins. On first start, CoC automatically installs the required language servers.

---

## Key Mappings

| Mode          | Key         | Action                         |
| ------------- | ----------- | ------------------------------ |
| Normal        | `<Space>gd` | Go to definition               |
| Normal        | `<Space>gr` | Show references                |
| Normal        | `<Space>gi` | Go to implementation           |
| Normal        | `<Space>rn` | Rename symbol                  |
| Normal        | `<Space>ca` | Code actions                   |
| Normal        | `<Space>dn` | Next diagnostic                |
| Normal        | `<Space>dp` | Previous diagnostic            |
| Normal        | `<Shift+K>` | Show hover documentation       |
| Normal        | `<Space>ff` | Find files (Telescope)         |
| Normal        | `<Space>fg` | Live grep (Telescope)          |
| Normal        | `<Space>fb` | List buffers (Telescope)       |
| Normal        | `<Space>fh` | Help tags (Telescope)          |
| Normal/Visual | `<Space>-`  | Open Yazi at current file      |
| Normal        | `<Space>cw` | Open Yazi in working directory |
| Normal        | `<C-Up>`    | Resume last Yazi session       |

---

## Configuration

* **Theme detection**: Uses `gsettings` on Linux (GNOME) and `defaults` on macOS. Falls back to light mode.
* **Statusline**: Handled by `lualine.nvim` with `onedark` theme.
* **LSP/Completion**: `coc.nvim` with `Tab`/`Shift+Tab` navigation and `Enter` to confirm.
* **Disable default mode**: `vim.opt.showmode = false` since lualine shows the current mode.

Customize plugin options, key mappings, or theme styles in `~/.config/nvim/init.lua` as needed.

---

## Troubleshooting

* **No theme on lualine**: Ensure `navarasu/onedark.nvim` is installed and listed before `lualine.nvim`.
* **Language servers not installed**: Run `:CocInstall coc-rust-analyzer coc-pyright coc-tsserver coc-volar` manually.

---

Happy coding! 🚀

