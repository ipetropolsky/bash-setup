# Ставим конфиг Starship, если его нет
# (SCRIPT_DIR устанавливается в вызывающем файле)
__config_file=~/.config/starship.toml
if [[ ! -e "$__config_file" ]]; then
    mkdir -p $(dirname $__config_file)
    cat $SCRIPT_DIR/config/starship.toml > $__config_file
fi
unset __config_file

# Включаем промпт
eval "$(starship init bash)"
