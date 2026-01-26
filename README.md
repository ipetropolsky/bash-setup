# Bash Setup

Базовая настройка `bash` и промпта.


## Установка

1) Если включаем Starship, устанавливаем его: https://starship.rs/guide/
```bash
curl -sS https://starship.rs/install.sh | sh
```

1) Выполняем `setup.sh` в `~/.bashrc`:
```bash
source path/to/setup.sh
```

ЛИБО запускаем в папке репозитория:
```bash
printf '%s\n' \
    '' \
    "# Setup environment (added $(date +"%Y-%m-%dT%H:%M:%S%z"))" \
    "source $(pwd)/setup.sh" >> ~/.bashrc
```

2) Открываем новый терминал либо запускаем в текущем:
```bash
source ~/.bashrc
```


## Настройка

В `setup.sh` отключаем лишнее или добавляем нужное.

### Если включали Starship

```bash
# Выбираем пресет
starship preset --help
starship preset pastel-powerline > ~/.config/starship.toml
starship preset gruvbox-rainbow > ~/.config/starship.toml
starship preset catppuccin-powerline > ~/.config/starship.toml

# Или возвращаем кастомный конфиг
cat ./config/starship.toml > ~/.config/starship.toml
```

## Продвинутая настройка

- https://ohmyz.sh/ (zsh)
- https://ohmyposh.dev/ (bash)
- https://starship.rs/ (all)
