# Who is this repository for ?

Any PHP / Javascript developer who wants a free, open-source and mostly keyboard-driven environment, and folks who want a way out of Jetbrains PhpStorm in particular (because that's what I did)

# What do you get if you use it ?

## Terminal

- Commands and paths autocompletion with fuzzy search
- Fuzzy search in your command history
- Autosuggestions
- Git branch displayed in your prompt when you're in a repo
- Syntax highlighting in `cat`, `man`, `grep`...
- Commands you type automatically colored in green (if they exist) or red (if they don't)
- Improved `ls` command with colors
- Navigation with Vim keybindings
- Smooth navigation between Tmux panes and Neovim windows
- Monokai Pro color theme
- A terminal that stays fast thanks to Alacritty and a light ZSH plugins setup

...in addition to everything Tmux itself brings to the table

## Neovim

- Easy plugin management
- File explorer
- Symbols explorer
- Syntax highlighting, completion, linting, formatting, code snippets and actions for PHP, Javascript, SQL, Json, Lua and Markdown
- Fuzzy search for projects, files names or contents (among other things)
- Easy navigation between open buffers (= tabs) with a buffer bar
- Git integration
- Xdebug integration
- Quick action to comment a line or a block
- Quick action to generate a docblock in PHP and Javascript
- Monokai Pro color theme

# What do you need to use it ?

- OS : any Linux distribution should work, Arch-based is recommanded because some stuff will require a manual installation if you don't have access to the AUR (I'm using EndeavourOS because I'm too lazy to install Arch)
- Window manager / desktop environment : anything that works on x11 (I'm using XFCE)
- Shell : ZSH
- Terminal emulator : Alacritty + Tmux for multiplexing
- Text editor / IDE : Neovim
- VCS : Git
- Everything listed in INSTALL.md is used at some point

# I'm sold, how do I install it ?

The folder structure is designed for easy installation with [GNU Stow](https://www.gnu.org/software/stow/). Each folder is a module and the sub-folders structure inside each module replicates the structure of your home folder. What that means is that to install, for example, zsh configuration, you can either :
- Install Stow and run `stow zsh` from the root folder of this repository (this will create symlinks at the right places in your home folder)
- Copy the content of "zsh" folder into your home folder. .zshenv will go in your home while everything else will go in `~/.config/zsh`

# Who is this configuration inspired from ?

- [Matthieu Cneude](https://github.com/Phantas0s) and his ["Building a Mouseless Development Environment" book](https://themouseless.dev/) for the idea of a keyboard-driven environment, for introducing me to Arch Linux, ZSH, Tmux and Neovim and for most of my Tmux configuration.
- [Christian Chiarulli](https://github.com/ChristianChiarulli) aka. "chris@machine" and his ["Neovim from scratch" video series](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ) 
 for most of Neovim configuration and for teaching me a bit of Lua while doing it.

# Why is it the repository called ".pub" ?

Like SSH keys, because it's public and has a private brother simply called "dotfiles" for stuff that includes personal information. :)
