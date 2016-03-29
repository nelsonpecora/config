source ~/config/antigen/antigen.zsh

# load oh-my-zsh
antigen use oh-my-zsh

# use oh-my-zsh bundles
antigen bundle git
antigen bundle heroku
antigen bundle copyfile
antigen bundle history
antigen bundle urltools
antigen bundle github
antigen bundle npm
antigen bundle nvm
antigen bundle brew
antigen bundle cloudapp
antigen bundle command-not-found
antigen bundle colored-man-pages
antigen bundle web-search
antigen bundle osx
antigen bundle emoji-clock

# syntax highlighting for cli commands
antigen bundle zsh-users/zsh-syntax-highlighting

# bd (like cd but it goes back up!)
antigen bundle Tarrasch/zsh-bd

# theme options
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_NVM_SHOW=false

# theme
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# custom aliases
source ~/config/zsh-aliases

# raise open file limit (for node)
ulimit -n 2048

# I think it’s time we blow this scene. Get everybody and the stuff together. OK. 3 2 1. Let’s jam!
antigen apply
