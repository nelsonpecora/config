# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh options

export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# - and _ are equivalent in autocompletion
HYPHEN_INSENSITIVE="true"

# update automatically without asking
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# disable marking untracked files under VCS as dirty. Speeds up repo checks.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# load oh my zsh
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# my options

# Prevent clobbering files with > (use >! if you want to override them)
setopt noclobber
# don't beep on error
setopt no_beep

# raise open file limit (for node)
ulimit -n 2048

# configure colors

export CLICOLOR=1
export LS_COLOR=1
# see dircolors for syntax: https://www.bigsoft.co.uk/blog/2008/04/11/configuring-ls_colors
# directories are bold and blue
# symlinks are cyan
# missing or orphaned files are red
# archives are magenta
# comics and images are yellow
# videos are green
export LS_COLORS='no=00:ow=00:ex=0:di=01;34:tw=01;34:ln=00;36:or=00;31:mi=00;31:*.zip=01;35:*.rar=01;35:*.7z=01;35:*.tar=01;35:*.gz=01;35:*.tgz=01;35:*.cbz=01;33:*.cbr=01;33:*.jpeg=00;33:*.jpg=00;33:*.png=00;33:*.gif=00;33:*.svg=00;33:*.webp=00;33:*.mov=00;32:*.mpeg=00;32:*.mp4=00;32:*.mkv=00;32:*.webm=00;32:*.avi=00;32:*.flv=00;32'
export BLOCK_SIZE=human-readable
export EDITOR=vim

# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# add stuff to $PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load yarn globals
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

# aliases

# git add everything and commit
alias gc="git add -A && git commit -m"

# git status
alias gs="git status -bs"

# count lines in a file | stdin
alias countlines="wc -l"

# count words in a file | stdin
alias countwords="wc -w"

# count characters in a file | stdin (including multi-bite characters)
alias countchars="wc -m"

# get human-readable file size
alias daisy="du -h -d 1"

# get html from clipboard
alias html='osascript -e '"'"'the clipboard as «class HTML»'"'"' | perl -ne '"'"'print chr foreach unpack("C*",pack("H*",substr($_,11,-3)))'"'"''

# be nice to the robots
alias please=sudo

# colors for grep
alias grep='grep --color=auto'

# easier yarn workspace command
alias w="yarn workspace"

# switch git branches
alias sb="git-switch-branch"

# OSX-specific aliases
if [[ "$(uname)" == "Darwin" ]]; then
    alias ls='ls -Gh'

    # make sure top orders by cpu usage first in OSX
    alias top='top -o cpu'

    # mung the path to favor newer things that are installed via homebrew
    export PATH=/usr/local/bin:$PATH

# Linux-specific aliases
elif [[ "$(uname)" == "Linux" ]]; then
    alias ls='ls --color=always -h'
fi

# I think it's time we blow this scene.
# Get everybody and the stuff together.
# OK. 3 2 1. Let's jam!