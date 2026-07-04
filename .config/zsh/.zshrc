fastfetch

# Shell
setopt AUTOCD
setopt NUMERIC_GLOB_SORT

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$XDG_STATE_HOME/zsh/history"

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# Completion
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

zstyle ':completion:*' menu select # tab opens cmp menu

setopt AUTO_MENU MENU_COMPLETE # autocmp first menu match
setopt NO_CASE_GLOB NO_CASE_MATCH # make cmp case insensitive

# Fzf
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
	source /usr/share/doc/fzf/examples/key-bindings.zsh
	source /usr/share/doc/fzf/examples/completion.zsh
fi

export FZF_CTRL_T_COMMAND="fdfind --type f --hidden --strip-cwd-prefix"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# Aliases
[ -f "$XDG_CONFIG_HOME/shell/aliases.sh" ] && source "$XDG_CONFIG_HOME/shell/aliases.sh"

# Colors
export LS_COLORS="di=1;32:ex=1;35:ln=1;36:"

# Bindings
bindkey "^b" beginning-of-line
bindkey "^e" end-of-line

# Prompt
git_branch() {
	echo '$(git branch 2> /dev/null | sed -n -e "s/^* \(.*\)/ (\1)/p")'
}

setopt PROMPT_SUBST

NEWLINE=$'\n'
PROMPT="${NEWLINE}%B%F{#8ea492}%~%f%F{#8792a4}$(git_branch)%f %F{#94a6a6}❯%f%b "
