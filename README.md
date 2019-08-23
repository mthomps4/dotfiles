## My current setup

### Vim
I try to keep a slim `.vimrc`
I've been experimenting with CoC autocomplete and Ale to land on a good combination for TypeScript/JavaScript.


Future:
Thinking I can leverage CoC Language Servers more and nix Ale entirely.
Ale currently has better tooling and helpers to leverage. For now this is a 1. 2. combo approach.


Setup:
Within a vim session
```
:PlugInstall
:CocInstall coc-json
:CocInstall coc-eslint
:CocInstall coc-prettier
:CocInstall coc-tsserver
:CocInstall coc-elixir
```
COC Eslint Prettier Options set in [/.vim/coc-settings.json](/.vim/coc-settings.json)


COC Links:
- [COC]("https://github.com/neoclide/coc.nvim")
- [COC-Elxir]("https://github.com/amiralies/coc-elixir")
- [COC-Typescript]("https://github.com/neoclide/coc-tsserver")
- [COC-Prettier]("https://github.com/neoclide/coc-prettier")
- [COC-Eslint]("https://github.com/neoclide/coc-eslint")



### Bashrc
Standard Ubuntu Setup with some extra helpers for AG SilverSearcher (FZF) and nvmrc help

- [AG SilverSearcher (FZF)]("https://github.com/ggreer/the_silver_searcher")

### Bash Aliases
Rando assortment of things I've found useful before.
Couple of docker purge/prune helpers and navigation
