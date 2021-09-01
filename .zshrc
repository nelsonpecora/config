### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk


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
z snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh

zt 0a
z snippet OMZ::plugins/thefuck/thefuck.plugin.zsh

zt 0a
z snippet OMZ::plugins/urltools/urltools.plugin.zsh

zt 0a
z snippet "https://raw.githubusercontent.com/caarlos0/zsh-mkc/master/mkc.plugin.zsh"

# Theme variables
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
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

# add stuff to $PATH

# make sure brew works
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Load yarn globals
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# configure pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# configure thefuck
eval $(thefuck --alias)

# configure nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# I think it’s time we blow this scene.
# Get everybody and the stuff together.
# OK. 3 2 1. Let’s jam!
