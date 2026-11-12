
#!/usr/bin/env bash

set -e

SOURCE="$HOME/niri-dotfiles"
CONFIG="$HOME/.config"

FOLDERS=(
    kitty
    niri
    waybar
    wofi
    fastfetch
)

echo "Проверка исходных папок..."

for folder in "${FOLDERS[@]}"; do
    if [[ ! -d "$SOURCE/$folder" ]]; then
        echo "Ошибка: $SOURCE/$folder не найдена!"
        exit 1
    fi
done

echo "Удаление старых конфигов..."

for folder in "${FOLDERS[@]}"; do
    rm -rf -- "$CONFIG/$folder"
done

echo "Копирование новых конфигов..."

for folder in "${FOLDERS[@]}"; do
    cp -a -- "$SOURCE/$folder" "$CONFIG/"
done

echo "Готово! Конфиги успешно установлены."
