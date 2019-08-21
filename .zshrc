# Install zplugin if not installed
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

HISTFILE="${HOME}/.histfile"

# Add local binaries to $PATH
export PATH=/usr/local/bin:$PATH

# Add ssh keys
ssh-add -A 2>/dev/null;

# ZSH Options
# Prevent clobbering files with > (use >! if you want to override them)
setopt noclobber
# Allow multiple terminal sessions to all append to one zsh command history
setopt append_history
# delete old recorded entry if new entry is a duplicate.
setopt hist_ignore_all_dups
# Lexical parsing of history
setopt hist_lex_words
# don't beep on error
setopt no_beep
# If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt auto_cd
# enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt prompt_subst
# don't push multiple copies of the same directory onto the directory stack
setopt pushd_ignore_dups
# make cd push the old directory onto the directory stack
setopt auto_pushd

# raise open file limit (for node)
ulimit -n 2048

# Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Load the default PS1: This will display while our other stuff loads
PS1='❯ '

# Functions to make configuration less verbose
zt() { zplugin ice wait"${1}" lucid               "${@:2}"; } # Turbo
z()  { [ -z $2 ] && zplugin light "${@}" || zplugin "${@}"; } # zplugin

# Oh-my-zsh libs
z snippet OMZ::lib/history.zsh

zt 0a
z snippet OMZ::lib/completion.zsh

zt 0a
z snippet OMZ::lib/nvm.zsh

zt 0a
z snippet OMZ::plugins/brew/brew.plugin.zsh

zt 0a
z snippet OMZ::plugins/yarn/yarn.plugin.zsh

zt 0a
z snippet OMZ::plugins/cloudapp/cloudapp.plugin.zsh

zt 0a
z snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh

zt 0a
z snippet OMZ::plugins/thefuck/thefuck.plugin.zsh

zt 0a
z snippet OMZ::plugins/urltools/urltools.plugin.zsh

zplugin ice svn wait"0" lucid atinit"local ZSH=\$PWD" \
    atclone"mkdir -p plugins; cd plugins; ln -sfn ../. osx"
z snippet OMZ::plugins/osx

zt 0a
z snippet "https://raw.githubusercontent.com/caarlos0/zsh-mkc/master/mkc.plugin.zsh"

# Theme variables
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_RUBY_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_PACKAGE_SHOW=true
SPACESHIP_PACKAGE_COLOR=grey
SPACESHIP_CHAR_SYMBOL='❯' # from sindresorhus/pure
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_GIT_STATUS_BEHIND=%{$fg[cyan]%}⇣%{$fg[red]%}
SPACESHIP_GIT_STATUS_AHEAD=%{$fg[cyan]%}⇡%{$fg[red]%}

# Theme
zt '!' pick'spaceship.zsh' blockf
z denysdovhan/spaceship-prompt

zt 0b
z zdharma/history-search-multi-word

zt 0b
z ael-code/zsh-colored-man-pages

zt 0b has'git' as'command'
z paulirish/git-open

zt 0a blockf
z zsh-users/zsh-completions

zt 0c atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
z zsh-users/zsh-history-substring-search

zt 0a atload'_zsh_autosuggest_start'
z zsh-users/zsh-autosuggestions

zt 0b atinit'_zpcompinit_fast; zpcdreplay'
z zdharma/fast-syntax-highlighting

# Custom aliases, functions, etc
source "$HOME/config/zsh-aliases"
source "$HOME/config/zsh-functions"
source "$HOME/config/zsh-variables"

# Load yarn globals
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# I think it’s time we blow this scene. Get everybody and the stuff together. OK. 3 2 1. Let’s jam!
