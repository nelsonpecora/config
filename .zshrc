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
zplug "zsh-users/zsh-history-substring-search", nice:19 # should be loaded last
zplug "zsh-users/zsh-syntax-highlighting", nice:18 # should be loaded 2nd last

# bd (like cd but it goes back up!)
zplug "Tarrasch/zsh-bd"

# mkc (recursive mkdir)
zplug "caarlos0/zsh-mkc"

# theme options
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_NVM_SHOW=false
SPACESHIP_PROMPT_SYMBOL=❯ # from sindresorhus/pure
SPACESHIP_GIT_UNPULLED=%{$fg[cyan]%}⇣%{$fg[red]%}
SPACESHIP_GIT_UNPUSHED=%{$fg[cyan]%}⇡%{$fg[red]%}

# theme
zplug "denysdovhan/spaceship-zsh-theme", as:theme

# custom aliases
source "$HOME"/config/zsh-aliases

# custom env variables
export HYPERTERM_SYNC_SETTINGS_PERSONAL_ACCESS_TOKEN=fe6c88261a5776d864100a87f65073e9e80a3066
export HYPERTERM_SYNC_SETTINGS_GIST_ID=cfb89fae97d3ee2737d10d07759d2633
export LS_COLORS=1
export CLICOLOR=1
export BLOCK_SIZE=human-readable # https://www.gnu.org/software/coreutils/manual/html_node/Block-size.html
export HISTSIZE=11000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
unset COMPLETION_WAITING_DOTS # https://github.com/tarruda/zsh-autosuggestions#known-issues
export DISABLE_AUTO_TITLE=true
export DISABLE_CORRECTION=true

### AUTOSUGGESTIONS ###
if zplug check zsh-users/zsh-autosuggestions; then
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down) # Add history-substring-search-* widgets to list of widgets that clear the autosuggestion
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}") # Remove *-line-or-history widgets from list of widgets that clear the autosuggestion to avoid conflict with history-substring-search-* widgets
fi

# Bind UP and DOWN arrow keys for subsstring search.
if zplug check zsh-users/zsh-history-substring-search; then
  zmodload zsh/terminfo
  bindkey "$terminfo[cuu1]" history-substring-search-up
  bindkey "$terminfo[cud1]" history-substring-search-down
fi

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
