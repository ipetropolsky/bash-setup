# Mac
export CLICOLOR=1

# Алиасы для частых команд с добавлением цвета
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'

# Если есть dircolors (обычно на Linux) — используем
if command -v dircolors >/dev/null 2>&1; then
    # dircolors -b выводит код для установки LS_COLORS
    eval "$(dircolors -b)"
fi
