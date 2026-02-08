__SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [[ ! -f "$__SCRIPT_DIR/.env" ]]; then
  echo "Create .env file:"
  echo "  cp $__SCRIPT_DIR/.env.example $__SCRIPT_DIR/.env"
  echo "Then rerun the script"
  return 1
fi

# Настройки
source "$__SCRIPT_DIR/.env"

__BASH_COMPLETION_FILE="$__SCRIPT_DIR/$BASH_SETUP_COMPLETION_FILE"

# Стираем всё что есть
: > "$__BASH_COMPLETION_FILE"

# Если автокомплит не включён, ничего не делаем
if [[ "$BASH_SETUP_USE_COMPLETION" != 'true' ]]; then
  return 0
fi

# Автокомплит для npm-скриптов
if command -v npm >/dev/null 2>&1; then
  printf '%s\n' \
    "# Added $(date +"%Y-%m-%dT%H:%M:%S%z") by ${BASH_SOURCE[0]}" \
    "$(npm completion)" \
    "" >> "$__BASH_COMPLETION_FILE"
fi

# Автокомплит для starship (если установлен)
if [[ "$BASH_SETUP_USE_STARSHIP" == 'true' ]]; then
  if command -v starship >/dev/null 2>&1; then
    printf '%s\n' \
      "# Added $(date +"%Y-%m-%dT%H:%M:%S%z") by ${BASH_SOURCE[0]}" \
      "$(starship completions bash)" \
      "" >> "$__BASH_COMPLETION_FILE"
  fi
fi

unset __SCRIPT_DIR
unset __BASH_COMPLETION_FILE

