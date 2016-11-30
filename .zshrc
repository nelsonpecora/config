ZPLUG_HOME="~/config/.zplug"

source ~/config/.zplug/init.zsh

# use oh-my-zsh bundles
zplug "plugins/urltools", from:oh-my-zsh # urlencode and urldecode
zplug "plugins/npm", from:oh-my-zsh # autocompletion for npm
zplug "plugins/nvm", from:oh-my-zsh # actual nvm, as a plugin
zplug "plugins/brew", from:oh-my-zsh # autocompletion for brew
zplug "plugins/cloudapp", from:oh-my-zsh # uploads things to cloudapp, copies url to clipboard
zplug "plugins/web-search", from:oh-my-zsh # google command, searches google from terminal
zplug "plugins/osx", from:oh-my-zsh # quick-look, tab (opens current dir in a tab)

# syntax highlighting for cli commands
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

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
source ~/config/zsh-aliases

# custom env variables
export HYPERTERM_SYNC_SETTINGS_PERSONAL_ACCESS_TOKEN=fe6c88261a5776d864100a87f65073e9e80a3066
export HYPERTERM_SYNC_SETTINGS_GIST_ID=cfb89fae97d3ee2737d10d07759d2633
export LS_COLORS=1

# set vim as default editor (for git commits, etc)
export EDITOR=vim

# raise open file limit (for node)
ulimit -n 2048

# set misc zsh options
setopt noclobber # prevent clobbering files with > (use >!)
setopt correctall # correct bad commands and arguments automatically!

# I think it’s time we blow this scene. Get everybody and the stuff together. OK. 3 2 1. Let’s jam!

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
