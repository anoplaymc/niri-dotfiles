
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

echo "Проверка исходных файлов..."

for folder in "${FOLDERS[@]}"; do
    if [[ ! -d "$SOURCE/$folder" ]]; then
        echo "Ошибка: папка $SOURCE/$folder не найдена!"
        exit 1
    fi
done

if [[ ! -f "$SOURCE/wallpaper.jpeg" ]]; then
    echo "Ошибка: wallpaper.jpeg не найден!"
    exit 1
fi

echo "Удаление старых конфигов..."

mkdir -p "$CONFIG"

for folder in "${FOLDERS[@]}"; do
    rm -rf -- "$CONFIG/$folder"
done

echo "Копирование новых конфигов..."

for folder in "${FOLDERS[@]}"; do
    cp -a -- "$SOURCE/$folder" "$CONFIG/"
done

echo "Установка обоев..."

cp -f -- "$SOURCE/wallpaper.jpeg" "$HOME/wallpaper.jpeg"

echo "Готово! Конфиги и обои успешно установлены."
