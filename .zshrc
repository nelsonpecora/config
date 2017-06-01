ZPLUG_HOME="$HOME/config/.zplug"

source "$ZPLUG_HOME"/init.zsh

# use oh-my-zsh bundles
zplug "plugins/urltools", from:oh-my-zsh # urlencode and urldecode
zplug "plugins/npm", from:oh-my-zsh # autocompletion for npm
zplug "plugins/nvm", from:oh-my-zsh # actual nvm, as a plugin
zplug "plugins/brew", from:oh-my-zsh # autocompletion for brew
zplug "plugins/cloudapp", from:oh-my-zsh # uploads things to cloudapp, copies url to clipboard
zplug "plugins/web-search", from:oh-my-zsh # google command, searches google from terminal
zplug "plugins/osx", from:oh-my-zsh # quick-look, tab (opens current dir in a tab)

# syntax highlighting and history substring search
zplug "zsh-users/zsh-completions"
zplug "tarruda/zsh-autosuggestions",            nice:10
zplug "zsh-users/zsh-syntax-highlighting",      nice:11
zplug "zsh-users/zsh-history-substring-search", nice:12

# bd (like cd but it goes back up!)
zplug "Tarrasch/zsh-bd"

# mkc (recursive mkdir)
zplug "caarlos0/zsh-mkc"

# theme options
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_PROMPT_SYMBOL=❯ # from sindresorhus/pure
SPACESHIP_GIT_BRANCH_PREFIX='\u200B'
SPACESHIP_GIT_STATUS_BEHIND=%{$fg[cyan]%}⇣%{$fg[red]%}
SPACESHIP_GIT_STATUS_AHEAD=%{$fg[cyan]%}⇡%{$fg[red]%}

# theme
zplug "denysdovhan/spaceship-zsh-theme", as:theme

# custom aliases
source "$HOME"/config/zsh-aliases

# custom env variables
export LS_COLORS=1
export CLICOLOR=1
export BLOCK_SIZE=human-readable # https://www.gnu.org/software/coreutils/manual/html_node/Block-size.html
export HISTSIZE=11000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
unset COMPLETION_WAITING_DOTS # https://github.com/tarruda/zsh-autosuggestions#known-issues
export DISABLE_AUTO_TITLE=true
export DISABLE_CORRECTION=true

# set vim as default editor (for git commits, etc)
export EDITOR=vim

# raise open file limit (for node)
ulimit -n 2048

# set misc zsh options
setopt noclobber # prevent clobbering files with > (use >!)
setopt correctall # correct bad commands and arguments automatically!
# misc history cleanup
setopt append_history
setopt hist_expire_dups_first
setopt hist_fcntl_lock
setopt hist_ignore_all_dups
setopt hist_lex_words
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt share_history

# I think it’s time we blow this scene. Get everybody and the stuff together. OK. 3 2 1. Let’s jam!

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# add ssh keys
ssh-add -A 2>/dev/null;

# Then, source plugins and add commands to $PATH
zplug load

if zplug check zsh-users/zsh-autosuggestions; then
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}")
fi

KEYTIMEOUT=1
bindkey -v

if zplug check zsh-users/zsh-history-substring-search; then
    bindkey '\eOA' history-substring-search-up
    bindkey '\eOB' history-substring-search-down
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
