# Built-in keybinds

There are a lot of base key binds that I need to remember that are easier to write down here. The custom ones are also in [vimrc](vimrc) but whatever it's good to have them here

## General

We use the leader key a lot, and it's mapped to SPACE

## Windows

I can create multiple windows in Vim and the REPL can also be made to use one of these. 

- `CTRL-w <Down>`; `CTRL-w CTRL-j`; `CTRL-w j`: Move cursor to Nth window below current one
- `CTRL-w <Up>`; `CTRL-w CTRL-k`; `CTRL-w k`: Move cursor to Nth window above current one
- `CTRL-w <Left>`; `CTRL-w CTRL-h`; `CTRL-w <BS>`; `CTRL-w h`: Move cursor to Nth window left of current one
- `CTRL-w <Right>`; `CTRL-w CTRL-l`; `CTRL-w l`: Move cursor to Nth window right of current one
- `CTRL-SHIFT-<Left>`; `CTRL-SHIFT-<Right>` : Split new window horizontally
- `CTRL-SHIFT-<Down>`; `CTRL-SHIFT-<Up>` : Split new window vertically
- `<NUMBER> CTRL-W |`: Resize current horizontal split to NUMBER characters
- `CTRL-W-W`: Switch between windows
- `CTRL-W =`: Make all windows same size

## Buffer navigation

- `CTRL-h`: Go to left buffer
- `CTRL-l`: Go to right buffer

## REPL and floating terminal

- `CTRL-f`: Toggle the foating terminal
- `LEADER r`: Toggle the repl window
- `LEADER e`: Terminate the repl
- `LEADER n`: Toggle the nerd tree file navigator

