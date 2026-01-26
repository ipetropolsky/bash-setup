# Ставим линк на конфиг
# SCRIPT_DIR устанавливается в вызывающем файле
__config_file=~/.config/starship.toml
if [[ ! -e "$__config_file" ]]; then
    mkdir -p $(dirname $__config_file)
    ln -s $SCRIPT_DIR/config/starship.toml $__config_file
fi
unset __config_file

# Включаем промпт
eval "$(starship init bash)"