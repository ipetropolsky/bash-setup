# Путь к конфигу Starship
__config_file=~/.config/starship.toml

# Создаём минималистичный кастомный конфиг Starship (только если конфига ещё нет)
if [[ ! -e "$__config_file" ]]; then
    mkdir -p $(dirname $__config_file)
    # SCRIPT_DIR устанавливается в вызывающем файле
    cat $SCRIPT_DIR/config/starship.toml > $__config_file
fi

unset __config_file

# Включаем промпт (запускается каждый раз при выполнении `.bashrc`)
eval "$(starship init bash)"
