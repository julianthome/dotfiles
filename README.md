# dotfiles

my personal configuration files for
- [vim](http://www.vim.org/) (with plugins managed by [pathogen](https://github.com/tpope/vim-pathogen))
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

# Installation

# checkout
```
git checkout https://github.com/julianthome/dotfiles.git
gut submodule init
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
ln -s <.vim> $HOME/.vim
ln -s <.vimrc> $HOME/.vimrc
ln -s <.zshrc> $HOME/.zshrc
ln -s <tmux.conf> $HOME/.tmux.conf
ln -s <.spacemacs> $HOME/.spacemacs
```

# python support through jedi
```
cd $HOME/.vim/bundle/jedi-vim/
git submodule update --init
```


# Remarks

* For a linux installation, the tmux configuration has
to be slightly modified: uncomment `reattach-to-user-namespace` in `.tmux.conf`.
* On linux, tmux should be aliased with `tmux -2` to get 256 color support.

![](https://www.dropbox.com/s/nyx0dfxxvaz1s3o/tmuxvimzsh.png?dl=1)
