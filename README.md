# dotfiles

my personal configuration files for
- [vim](http://www.vim.org/) (with plugins managed by [pathogen](https://github.com/tpope/vim-pathogen))
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

# Installation

# checkout
```
git clone https://github.com/julianthome/dotfiles.git
git submodule init
git submodule update
```

# install oh-my-zsh
```
cd oh-my-zsh/tools
./install.sh
chsh -s /sbin/zsh
```

# link configuration
```
ln -s dotfiles/.vim 
ln -s dotfiles/.vimrc
ln -s dotfiles/.zshrc 
ln -s dotfiles/tmux.conf 
ln -s dotfiles/.spacemacs
```


# Remarks
* For a linux installation, the tmux configuration has
to be slightly modified: uncomment `reattach-to-user-namespace` in `.tmux.conf`.
* On linux, tmux should be aliased with `tmux -2` to get 256 color support.
