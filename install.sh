```bash
#!/usr/bin/env bash

set -e

# Путь к папке, в которой находится install.sh
SOURCE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

CONFIG="$HOME/.config"
LOCAL_STATE="$HOME/.local/state"

FOLDERS=(
    kitty
    niri
    waybar
    wofi
    fastfetch
)

echo "Проверка исходных файлов..."

# Проверяем основные конфиги
for folder in "${FOLDERS[@]}"; do
    if [[ ! -d "$SOURCE/$folder" ]]; then
        echo "Ошибка: папка $SOURCE/$folder не найдена!"
        exit 1
    fi
done

# Проверяем обои
if [[ ! -f "$SOURCE/wallpaper.jpeg" ]]; then
    echo "Ошибка: wallpaper.jpeg не найден!"
    exit 1
fi

# Проверяем Noctalia
if [[ ! -d "$SOURCE/noctalia" ]]; then
    echo "Ошибка: папка $SOURCE/noctalia не найдена!"
    exit 1
fi

echo "Создание необходимых директорий..."

mkdir -p "$CONFIG"
mkdir -p "$LOCAL_STATE"

echo "Удаление старых конфигов..."

for folder in "${FOLDERS[@]}"; do
    rm -rf -- "$CONFIG/$folder"
done

rm -rf -- "$LOCAL_STATE/noctalia"

echo "Копирование конфигов..."

for folder in "${FOLDERS[@]}"; do
    cp -a -- "$SOURCE/$folder" "$CONFIG/"
done

echo "Установка Noctalia..."

cp -a -- "$SOURCE/noctalia" "$LOCAL_STATE/"

echo "Установка обоев..."

cp -f -- "$SOURCE/wallpaper.jpeg" "$HOME/wallpaper.jpeg"

echo ""
echo "=================================="
echo " Райс успешно установлен!"
echo "=================================="
echo ""
echo "Установлено:"
echo "  kitty      -> ~/.config/kitty"
echo "  niri       -> ~/.config/niri"
echo "  waybar     -> ~/.config/waybar"
echo "  wofi       -> ~/.config/wofi"
echo "  fastfetch  -> ~/.config/fastfetch"
echo "  noctalia   -> ~/.local/state/noctalia"
echo "  wallpaper  -> ~/wallpaper.jpeg"
echo ""
echo "Готово!"
```
