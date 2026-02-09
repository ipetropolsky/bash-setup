__SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [[ ! -f "$__SCRIPT_DIR/.env" ]]; then
  echo "Create .env file:"
  echo "  cp $__SCRIPT_DIR/.env.example $__SCRIPT_DIR/.env"
  echo "Then execute your .bashrc:"
  echo "  source $HOME/.bashrc"
  return 1
fi

# Настройки
source "$__SCRIPT_DIR/.env"

__BASH_COMPLETION_FILE="$__SCRIPT_DIR/$BASH_SETUP_COMPLETION_FILE"

if [[ "$BASH_SETUP_TUNE_HISTORY" == 'true' ]]; then
  source "$__SCRIPT_DIR/features/history.sh"
fi

if [[ "$BASH_SETUP_TUNE_WINDOW" == 'true' ]]; then
  source "$__SCRIPT_DIR/features/window.sh"
fi

if [[ "$BASH_SETUP_USE_COLORS" == 'true' ]]; then
  source "$__SCRIPT_DIR/features/terminal-colors.sh"
fi

if [[ "$BASH_SETUP_USE_PROMPT" == 'true' ]]; then
  if [[ "$BASH_SETUP_USE_STARSHIP" == 'true' ]]; then
    source "$__SCRIPT_DIR/features/starship.sh"
  else
    source "$__SCRIPT_DIR/features/colored-prompt.sh"
  fi
fi

# Подключение алиасов
if [[ "$BASH_SETUP_USE_ALIASES" == 'true' ]]; then
  source "$__SCRIPT_DIR/features/aliases.sh"
fi

# Подключение исполняемых скриптов из папки bin
if [[ "$BASH_SETUP_USE_BIN" == 'true' ]]; then
  export PATH="$PATH:$__SCRIPT_DIR/bin"
fi

# Подключение автокомплита (см. setup-completion.sh)
if [[ "$BASH_SETUP_USE_COMPLETION" == 'true' ]]; then
  if [[ -f "$__BASH_COMPLETION_FILE" ]]; then
    source "$__BASH_COMPLETION_FILE"
  fi
fi

unset __SCRIPT_DIR
unset __BASH_COMPLETION_FILE
