# Bash Setup

Базовая настройка `bash` и промпта.

## Установка

Рекомендуется сделать форк и работать с ним, чтобы можно было коммитить изменения в свой репозиторий.

1) Создаём файл настроек:
```bash
# В папке репозитория
cp .env.example .env
```

2) Запускаем `setup.sh`:
```bash
# В папке репозитория
source setup.sh
```

Будет выведена команда, которую нужно добавить в свой `~/.bashrc` (если его нет — создать).

Для автоматической установки используйте:
```bash
source setup.sh -y
```

3) Чтобы изменения применились, открываем новый терминал.

## Настройка

Включаем или отключаем варианты в `.env`.

Открываем новый терминал.

## Настройка промпта с помощью Starship

1) Устанавливаем Starship ([полная инструкция](https://starship.rs/guide/)):
```bash
curl -sS https://starship.rs/install.sh | sh
```

2) Включаем в `.env` подключение Starship. 

3) Опционально: Настраиваем Starship в своём `~/.config/starship.toml`

Можно настроить руками [по документации](https://starship.rs/config/).

Можно использовать пресеты:
```bash
starship preset --help

# Выбираем пресет из доступных и заливаем в файл конфига
# Попробуйте <preset-name>: pastel-powerline, gruvbox-rainbow, catppuccin-powerline 
starship preset <preset-name> > ~/.config/starship.toml
```

Вернуть конфиг для Starship из этого репозитория:
```bash
# В папке репозитория
cat ./config/starship.toml > ~/.config/starship.toml
```

## Продвинутая настройка шелла

- https://ohmyz.sh/ (zsh)
- https://ohmyposh.dev/ (bash)
- https://starship.rs/ (all)

## Документация

- [Bash Startup Files](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/html_node/Bash-Startup-Files.html) ([русский](https://wiki.archlinux.org/title/Bash_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)))
- [Controlling the Prompt](https://www.gnu.org/software/bash/manual/html_node/Controlling-the-Prompt.html) ([русский](https://wiki.archlinux.org/title/Bash_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)/Prompt_customization_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)))
