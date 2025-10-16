#!/bin/bash

# Скрипт быстрой установки VPN Auto-Installer одной командой
# curl -sSL https://raw.githubusercontent.com/yourusername/vpn-auto-installer/main/quick-install.sh | bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[QuickInstall]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

# Проверка root прав
if [[ $EUID -ne 0 ]]; then
   error "Этот скрипт должен запускаться с правами root!"
fi

log "🚀 Начинается быстрая установка VPN Auto-Installer"

# Определение временной директории
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Загрузка основного скрипта
log "📥 Загрузка основного скрипта..."
if ! curl -sSL -o vpn-auto-installer.sh "https://raw.githubusercontent.com/yourusername/vpn-auto-installer/main/vpn-auto-installer.sh"; then
    error "Не удалось загрузить основной скрипт"
fi

# Запуск установки
log "▶️  Запуск автоустановщика..."
chmod +x vpn-auto-installer.sh
./vpn-auto-installer.sh "$@"

# Очистка
cd /
rm -rf "$TEMP_DIR"

log "✅ Быстрая установка завершена!"
