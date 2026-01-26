# Bash Setup

Базовая настройка `bash` и промпта.


## Установка

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


## Продвинутая настройка

- https://ohmyz.sh/ (zsh)
- https://ohmyposh.dev/ (bash)
- https://starship.rs/ (all)
