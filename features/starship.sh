# Если нет starship, ничего не делаем
if ! command -v starship >/dev/null 2>&1; then
  echo "Install Starship or disable it in $__SCRIPT_DIR/.env"
  return 0
fi

# Путь к конфигу Starship
__STARSHIP_CONFIG_FILE="$HOME/.config/starship.toml"

# Создаём минималистичный кастомный конфиг Starship (только если конфига ещё нет)
if [[ ! -e "$__STARSHIP_CONFIG_FILE" ]]; then
    mkdir -p "$(dirname "$__STARSHIP_CONFIG_FILE")"
    cat "$__SCRIPT_DIR/config/starship.toml" > "$__STARSHIP_CONFIG_FILE"
fi

unset __STARSHIP_CONFIG_FILE

# Включаем промпт (запускается каждый раз при выполнении `.bashrc`)
eval "$(starship init bash)"
