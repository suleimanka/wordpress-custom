#!/bin/bash
set -e

# Инициализация тома (если пустой)
if [ -z "$(ls -A /bitnami/wordpress)" ]; then
    echo "Initializing WordPress volume"
    # Копируем, преобразуя симлинки в реальные файлы
    cp -rL /opt/bitnami/wordpress/. /bitnami/wordpress/
fi

# Основное копирование при каждом запуске
echo "Copying WordPress data from volume to working directory"

# Копируем с преобразованием симлинков
cp -rL --no-preserve=mode,ownership,timestamps /bitnami/wordpress/. /opt/bitnami/wordpress/

# Запуск оригинального entrypoint
if [[ $# -eq 0 ]]; then
    set -- "/opt/bitnami/scripts/apache/run.sh"
fi

exec /opt/bitnami/scripts/wordpress/entrypoint.sh "$@"