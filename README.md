# The Configurator

* git configuration, aliases, and ignore
* terminal and vim colors
* zsh config and aliases
* linting configs

## To Install

1. Clone this repo to `~/config`
2. Symlink files in this repo:

```
cd ~ && ln -s config/.gitignore .gitignore && ln -s config/.gitconfig .gitconfig && ln -s config/.vim .vim && ln -s config/.vimrc .vimrc
```

3. Copy private env from [this gist](https://gist.github.com/nelsonpecora/fa697f254626e4db1c3c2c0fc27ce8b4) into `~/.zshrc`
4. Install `zplugin` with `sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"`
5. Remove extra zplugin stuff added to `~/.zshrc`
6. Install nvm, latest node (using nvm), yarn
7. `yarn global add npx nodemon tldr standard`

## To Update

```
zplugin self-update
```
