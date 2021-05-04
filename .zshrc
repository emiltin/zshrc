
# enable the default zsh completions!
autoload -Uz compinit && compinit
autoload -U colors && colors

# prompt
# show git branch on prompt, see https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats " %{$fg[blue]%}(%b)%{$reset_color%}"
precmd() {
  vcs_info
}
setopt prompt_subst
PROMPT='%B%F{245}%2~%f%b${vcs_info_msg_0_} %# '


# store commmands in a history file
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

# limit how much history is stored in the session and the history file
HISTSIZE=2000
SAVEHIST=10000

# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY

# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# rbenv setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# alises. trailing space to enable alias chaining
alias be='bundle exec '
