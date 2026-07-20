# Built-in keybinds

There are a lot of base key binds that I need to remember that are easier to write down here

## Windows

I can create multiple windows in Vim and the REPL can also be made to use one of these. 

Navigate between up/down/left/right windows with

- `CTRL-W <Down>`; `CTRL-W CTRL-J`; `CTRL-W j`: Move cursor to Nth window below current one.  Uses the cursor position to select between alternatives.
- CTRL-W <Up>; CTRL-W CTRL-K; CTRL-W k: Move cursor to Nth window above current one.  Uses the cursor position to select between alternatives.
- `CTRL-W <Left>`; `CTRL-W CTRL-H`; `CTRL-W <BS>`; `CTRL-W h`: Move cursor to Nth window left of current one. Uses the cursor position to select between alternatives.
- `CTRL-W <Right>`; `CTRL-W CTRL-L`; `CTRL-W l`: Move cursor to Nth window right of current one.  Uses the cursor position to select between alternatives.
- `CTRL-SHIFT-<Left>`; `CTRL-SHIFT-<Right>` : Split new window horizontally
- `CTRL-SHIFT-<Down>`; `CTRL-SHIFT-<Up>` : Split new window vertically
- `<NUMBER> CTRL-W |`: Resize current horizontal split to NUMBER characters

# Custom keybinds

This is also in [vimrc](vimrc) but whatever

## General

We use the leader key a lot, and it's mapped to space

```
let g:mapleader=' '
```

## Normal mode

Buffer navigation with

```
CTRL-H Go to left buffer
CTRL-L Go to right buffer
```

:W :w
:Q :q
:WQ :wq
<C-f> :FloatermToggle<CR>
<leader>r :REPLToggle<CR>
<leader>e :REPLSendSession<CR>
<leader>n :NERDTreeToggle<CR>

# Visual mode

vmap < <gv
vmap > >gv
