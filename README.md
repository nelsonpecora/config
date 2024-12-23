# The Configurator

* git configuration, aliases, and ignore
* terminal and vim colors
* zsh config and aliases
* linting configs

## To Install

1. Clone this repo to `~/www/config`
2. Symlink files in this repo:

```
cd ~ 
ln -s www/config/.gitignore .gitignore 
ln -s www/config/.gitconfig .gitconfig 
ln -s www/config/.vim .vim 
ln -s www/config/.vimrc .vimrc
ln -s www/config/.zshrc .zshrc
ln -s www/config/.p10k.zsh .p10k.zsh
```

3. Install `oh-my-zsh`
4. Install p10k plugin
5. Globally install `git-switch-branch` from npm
6. Restart zsh with `exec zsh`

