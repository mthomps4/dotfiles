
# Matt's Dotfiles

## Welcome 2023
I've done this one to may times... so here we go again :)
At this point I figured I'd start keeping a "historic" view -- while there's over a decade of dotfiles. 
This repo will have the recent adventures with updated Neovim and whatever adventure lies next. 

## Uses

In no particular order

- iTerm2 | Windows Termial (WSL)
- [oh-my-zsh](https://ohmyz.sh/) | [p10k](https://github.com/romkatv/powerlevel10k)
- [lunarvim](https://www.lunarvim.org/)
- tmux | ssh
- asdf
- ngrok
- FZF | Telescope

## Optional Notes (personal pref)

### Update Telescope to Find Files with personal globs
One additional setup outside of dotfiles. 
After Installing Lunarvim and adding the config file. 
Navigate to `.local/share/lunarvim/lua/lvim/core`
Update two files: 

### which-key.lua
Update the ["f"] binding to `find_files` instead of `git_files`
```lua
["f"] = { require("telescope.builtin").find_files, "Find File" },
```

### telescope.lua
Update the find_file options with a find_command globs
```lua
find_command = { "rg", "--files", "--hidden", "--ignore", "-u", "--glob=!**/.git/*", "--glob=!**/node_modules/*", "--glob=!**/.next/*", "--glob=!yarn.lock" },

```

This ensures when you fuzzy find, you find/ignore what you expect. For me this included some files within the .gitignore. So I now explicitly ignore other folders with `--glob`. Overtime, this will probably include build, dist, etc. 
