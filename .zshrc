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

# syntax highlighting for cli commands
antigen bundle zsh-users/zsh-syntax-highlighting

# theme
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# theme options
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_NVM_SHOW=false

# custom aliases
source ~/config/zsh-aliases

# I think it’s time we blow this scene. Get everybody and the stuff together. OK. 3 2 1. Let’s jam!
antigen apply
