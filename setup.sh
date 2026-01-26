SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Тюнинг истории
source $SCRIPT_DIR/features/history.sh

# Что-то про размеры окна
source $SCRIPT_DIR/features/window.sh

# Цвета в терминале
source $SCRIPT_DIR/features/terminal-colors.sh

# Простой промпт с расцветкой и веткой Git
source $SCRIPT_DIR/features/colored-prompt.sh

# Мощный настраиваемый промпт с контекстной информацией
# https://starship.rs/guide/
source $SCRIPT_DIR/features/starship.sh

# Автодополнение для npm-скриптов
# Обновить: npm completion > ./features/npm-completion.sh
source $SCRIPT_DIR/features/npm-completion.sh
