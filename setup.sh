SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Тюнинг сохранения и размера истории консоли
source $SCRIPT_DIR/features/history.sh

# Что-то про размеры окна терминала
source $SCRIPT_DIR/features/window.sh

# Цвета в терминале
source $SCRIPT_DIR/features/terminal-colors.sh

# Автодополнение для npm-скриптов
# Как обновить: npm completion > ./features/npm-completion.sh
source $SCRIPT_DIR/features/npm-completion.sh

# Простой промпт с расцветкой и веткой Git
source $SCRIPT_DIR/features/colored-prompt.sh

# Мощный настраиваемый промпт с контекстной информацией
# Используется вместо colored-prompt.sh
#
# Ставит минималистичный конфиг с выводом ветки Git и подсветкой кода ответа предыдущей команды
# Требует предварительной установки Starship: https://starship.rs/guide/
#
#source $SCRIPT_DIR/features/starship.sh
