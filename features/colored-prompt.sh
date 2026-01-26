# Если мы не в интерактивном режиме, ничего не делаем
[[ $- != *i* ]] && return

# Если нет промпта, ничего не делаем
[[ -z '${PS1-}' ]] && return

# Если цвет не поддерживается, ничего не делаем
command -v tput >/dev/null 2>&1 && tput setaf 1 >/dev/null 2>&1 || return

git_branch() {
    previous_code=$?
    git symbolic-ref --short HEAD 2>/dev/null
    return $previous_code
}

set_prompt() {
    local reset='\[\033[0m\]'
    local bold='\[\033[1m\]'
    local red='\[\033[1;31m\]'
    local green='\[\033[1;32m\]'
    local blue='\[\033[1;34m\]'
    local purple='\[\033[1;35m\]'
    local white='\[\033[1;37m\]'
    local gray='\[\033[1;90m\]'

    # Текущая папка
    local path_part=${blue}'\w'${reset}

    # Хост и юзер для SSH
    local ssh_part=''
    if [ -n "$SSH_CONNECTION" ]; then
        ssh_part=${green}'\u@\h'${reset}':'
    fi

    # Ветка Git (если есть)
    local branch_part=':'${green}'$(git_branch)'${reset}

    # Цвет $ по exit code
    # local dollar_part='$(ret=\?; if [ $ret -eq 0 ]; then printf "%s" $'\''\033[37m'\''; elif [ $ret -gt 128 ]; then printf "%s" $'\''\033[35m'\''; else printf "%s" $'\''\033[31m'\''; fi; printf "$")'"$reset"
    local dollar_part='$(ret=$?; if [ $ret -eq 0 ]; then echo "'${white}'"; elif [ $ret -gt 128 ]; then echo "'$purple'"; else echo "'$red'"; fi)\$'${reset}

    # color of '$' depending on last exit code (success / failure / failure with signal)
    colored_prompt_part='\[\033[00;$(ret=$?; if [ $ret -eq 0 ]; then echo 32; elif [ $ret -gt 128 ]; then echo 35; else echo 31; fi)m\]\$\[\033[00m\] '

    # replace PS1, but only if it's already colored
    PS1="${PS1/%'\[\033[00m\]\$ '/"$colored_prompt_part"}"


    # echo ${bold}${blue}'\w'${branch_part}${dollar_part}${reset}' '
    echo '\n'${ssh_part}${path_part}${branch_part}${dollar_part}' '
}

PS1="$(set_prompt)"
