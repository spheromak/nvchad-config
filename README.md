## nvchad-config
nvChad customizations for use with nvchad  https://nvchad.com/ setup mostly for doing work on Go, and in tmux. Generally running formatters, and cleaning whitespace on exit.

## Install
Simply clone this repo to  `$HOME/.config/nvim/lua/custom` after you have setup nvchad.

```
git clone https://github.com/spheromak/nvchad-config.git $HOME/.config/nvim/lua/custom


```
You may need to remove the custom dir if it already exists

## Getting started
This setup uses  <space> leader, most keybinds are registered with nvchad, so using `<leader>-ch` or hitting space and waiting will both pop up  the inline help. Here are a few things that I've customized

- `ctrl-h|j|k|l`: will always move between split panes, and tmux panes
- `<leader>-h|v`: h: spawns a terminal horizontal split, v: spawns it vertical split
- `<alt>i`: toggles floating term. This terminal wont' re-init on successive toggles.
- `<leader>-K`: get LSP definition
- `<leader>-1|2|3|4|5`: switch to buffers 1/2/3/4/5 - buffers in nvchad look like "tabs" at the top.
- `<ctrl>-1|2|3|4|5`:  swithc to vim tab 1/2/3/4/5  - these are new windows with more buffers.
- `n`: when in normal mode this will goto the next diagnostic, and pop a floating window. These are inlined as well but I might turn that off in the future.
- `<ctrl>-n`: toggle the nvTree navigation window
- `<leader>-m`: set vim mark

Most bindings are defined either in `plugin_mappings.lua` or `mappings.lua`
