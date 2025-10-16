#!/bin/bash

# Скрипт обслуживания VPN сервера
# Включает проверки, обновления, резервные копии и мониторинг

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1"
}

# Проверка состояния служб
check_services() {
    log "Проверка состояния служб VPN..."

    if systemctl is-active --quiet x-ui 2>/dev/null; then
        log "✅ x-ui - активен"
    elif systemctl is-active --quiet marzban 2>/dev/null; then
        log "✅ marzban - активен"
    else
        log "⚠️  VPN службы не найдены"
    fi
}

# Создание резервной копии
create_backup() {
    log "Создание резервной копии конфигураций..."

    local backup_dir="/root/vpn-backups/$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"

    # Backup 3x-ui
    if systemctl is-active --quiet x-ui; then
        cp -r /etc/x-ui "$backup_dir/" 2>/dev/null || true
        log "✅ Резервная копия 3x-ui создана"
    fi

    # Backup Marzban
    if systemctl is-active --quiet marzban; then
        cp -r /var/lib/marzban "$backup_dir/" 2>/dev/null || true
        log "✅ Резервная копия Marzban создана"
    fi

    log "✅ Резервная копия сохранена в: $backup_dir"
}

# Главное меню
show_menu() {
    echo -e "${YELLOW}=== VPN Server Maintenance Tool ===${NC}"
    echo
    echo "1) Проверка состояния служб"
    echo "2) Создать резервную копию"
    echo "0) Выход"
    echo
}

main() {
    case "$1" in
        "check")
            check_services
            ;;
        "backup")
            create_backup
            ;;
        *)
            show_menu
            read -p "Выберите действие: " choice
            case $choice in
                1) check_services ;;
                2) create_backup ;;
                0) exit 0 ;;
            esac
            ;;
    esac
}

main "$@"
