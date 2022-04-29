# NVim dotfiles

This is my personnal neovim config, feel free to override it!

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
 - Dart
 - Typescript

 I also plan to add support for others, so be on the lookout!

## Add your custom config

You should'nt edit directly the config files. Instead you can create a file at `~/.config/nvim/user_custom.vim`, so your personnal modifications won't be overwritten in future updates.

## Dependencies

* nvim >= 3.8
* python3
* pynvim: `pip install pynvim --user`
* nodejs
* yarn
* git
* curl

Optionals:
* ranger
* grammalecte
* rls
* cquery
* dart_language_server

## Install intructions

First make sure that you have all the necessary dependencies.
Then clone this repo and move and the files in the `nvim` directory at `~/.config/nvim/`.

In future releases I expect to create an install script.

## Controls and custom mappings

All the default controls of vim are unmodified except for the s/S substitue keys.

### Editor Layout and navigation

* `Leader + .` Set the working directory at the current buffer

Layout:
* `Leader + v` split vertically
* `Leader + h` split horizontally

Navigation:
* ``T or GT `` open a new tab
* `Shift + Tab` go to next tab
* `Ctrl + pageup or pagedown` navigate between tabs

* `Leader + c` close current buffer

* `s + two first characters of a word` jump to a word downward cursor
* `S + two first characters of a word` jump to a word upside cursor

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

* `Ctrl + p` open file fuzzy finder
* `F3 or Ctrl + e` open filesystem tree
* `Leader + f` open ranger file finder (needs ranger as dependancy)
* `Leader + e` open fzf fuzzy finder

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

### Other integrations

Grammalecte (french grammar corrector)

* `Leader + gc` grammalecte check
* `Leader + gcc` grammalecte clear

Terminal and Shell

* `Leader + t + m` open terminal in current buffer
* `Leader + s + h` open vim shell in current buffer
