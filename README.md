# Plug setup

Run this

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then start vim and run `:PlugInstall` then restart and boom

# Color theme

From [here](https://github.com/Erichain/vim-monokai-pro)

# Formatters

There are some formatters to install to get the autocommands working

1. Julia: runic from [here](https://github.com/fredrikekre/Runic.jl)
2. C: clang-format by running `sudo apt install clang-format`
3. Python: black from [here](https://github.com/psf/black)
4. R: air from [here](https://posit-dev.github.io/air/cli.html)

I don't use any packages to do this, just an autocommand in `vimrc`

# System clipboard

Make sure that the system clipboard is accessible with

```
sudo apt install vim-gtk3
```


