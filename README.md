# Vim dotfiles

This is my personnal (n)vim config, feel free to override it!
I only update the neovim one.


# Screenshots
![ C
](https://i.imgur.com/h8i7aaP.png)
![ Rust
](https://i.imgur.com/h0c0HOA.png)

## Languages bindings
I mostly work with a few languages and I adapted my config to work with :
 - C
 - C++
 - Rust

 I also plan to add support for others, so be on the lookout!

## Add your custom config

The main config file includes the .vim.local config. If you need to add your own config, use this file.


## Dependancies

* Ranger
* Grammalecte
* rls
* cquery
* nodejs

## Controls and custom mappings

All the default controls of vim are unmodified.

I only addded some leader based commands and key strokes.

### Editor Layout and navigation

Layout:
* `Leader + v`split vertically
* `Leader + h`split horizontally

Navigation:
* ``T `` open a new tab
* `Shift + Tab` go to next tab
* `Ctrl + pageup or pagedown` navigate between tabs

* `Leader + c` close current buffer

The editor rely on a "tiling manager" like capacities :

* `Ctrl + Alt + hjkl` resize current buffer
* `Alt + Shift + hjkl`move current buffer

### Language Server Protocol integration

All the LSP support comes from Intellisense (COC)

* `Space + a`show all errors/warnings of the current project
* `Leader + a + c`show quick actions for the symbol under cursor
* `Leader + r + n` rename current symbol in the whole project
* `Leader + F` format current buffer
* `Leader + qf` quick fix
* `gd` go to definition of the symbol under cursor
* `gr` find all reference of the symbol under cursor
* `gy`go to type definition
* `gi`go to type implementation
* `Space + s` open symbol list

### Filesystem navigation

* `Ctrl + p`open file fuzzy finder
* `F3 or Ctrl + e`open filesystem tree
* `Leader + f`open ranger file finder (needs ranger as dependancy)

### Git integration

* `Leader +  ga `Git add
* `Leader +  gc `Git commit
* `Leader +  gsh` Git push
* `Leader +  gll` Git pull
* `Leader +  gs `Git status
* `Leader +  gb `Git blame
* `Leader +  gd `Git diff
* `Leader +  gr `Git remove

### Code editing

* `<` indent selection on the left
* `>` indent selection on the right

### Gramalecte integration

* `Leader + gc` grammalecte check
* `Leader + gcc` grammalecte clear
