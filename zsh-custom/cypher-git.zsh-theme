# Based on cypher, but with git on the right
# Shows the exit status of the last command if non-zero
# Uses "#" instead of "»" when running with elevated privileges
PROMPT="%{$fg[magenta]%}∴ %{${fg[blue]}%}%3~%(0?. . %{${fg[red]}%}%?↵ )%{${fg[blue]}%}➜%{${reset_color}%} "

# GIT ON RIGHT PROMPT
# local git_branch='$(git_prompt_status) %{$reset_color%}$(git_prompt_info)%{$reset_color%}'
source ~/config/zsh-git-prompt/zshrc.sh
local git_branch='$(git_super_status)'

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY=""
# ZSH_THEME_GIT_PROMPT_CLEAN=""
#
# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
RPROMPT="${git_branch}"
