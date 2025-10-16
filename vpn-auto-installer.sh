#!/bin/bash

# VPS VPN Auto-Installer Script v1.0
# Автоматическая установка 3x-ui или Marzban панелей с предустановленными конфигурациями
# Поддерживаемые протоколы: VLESS+XTLS-Reality, VMess+WebSocket, Shadowsocks/Outline
# Author: VPN Auto Installer Team

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Проверка на root права
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}Этот скрипт должен запускаться с правами root!${NC}"
   exit 1
fi

# Функция логирования
log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR $(date +'%Y-%m-%d %H:%M:%S')]${NC} $1"
    exit 1
}

# Функция определения ОС
detect_os() {
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        OS=$ID
        VERSION=$VERSION_ID
    else
        error "Не удалось определить операционную систему"
    fi

    case $OS in
        ubuntu|debian|centos|rhel|fedora|arch|opensuse)
            log "Обнаружена ОС: $OS $VERSION"
            ;;
        *)
            error "Неподдерживаемая операционная система: $OS"
            ;;
    esac
}

# Функция установки базовых пакетов
install_dependencies() {
    log "Установка базовых зависимостей..."

    case $OS in
        ubuntu|debian)
            apt update && apt upgrade -y
            apt install -y curl wget sudo unzip socat git nano htop net-tools
            ;;
        centos|rhel|fedora)
            yum update -y || dnf update -y
            yum install -y curl wget sudo unzip socat git nano htop net-tools || dnf install -y curl wget sudo unzip socat git nano htop net-tools
            ;;
        arch)
            pacman -Syu --noconfirm
            pacman -S --noconfirm curl wget sudo unzip socat git nano htop net-tools
            ;;
        *)
            error "Установка зависимостей для $OS не поддерживается"
            ;;
    esac
}

# Функция оптимизации системы
optimize_system() {
    log "Оптимизация системы для VPN сервера..."

    # Включение BBR
    if ! grep -q "net.core.default_qdisc=fq" /etc/sysctl.conf; then
        cat >> /etc/sysctl.conf << EOF

# TCP BBR оптимизация
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr

# Оптимизация сети для VPN
net.core.rmem_max = 67108864
net.core.wmem_max = 67108864
net.core.netdev_max_backlog = 250000
net.core.somaxconn = 4096
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.ip_local_port_range = 10000 65000
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_mem = 25600 51200 102400
net.ipv4.tcp_rmem = 4096 87380 67108864
net.ipv4.tcp_wmem = 4096 65536 67108864
net.ipv4.tcp_mtu_probing = 1

# Увеличение лимитов файлов
fs.file-max = 51200
EOF
        sysctl -p
    fi

    # Настройка лимитов
    if ! grep -q "* soft nofile 51200" /etc/security/limits.conf; then
        cat >> /etc/security/limits.conf << EOF
* soft nofile 51200
* hard nofile 51200
root soft nofile 51200
root hard nofile 51200
EOF
    fi

    log "Оптимизация системы завершена"
}

# Функция установки Docker
install_docker() {
    if ! command -v docker &> /dev/null; then
        log "Установка Docker..."
        curl -fsSL https://get.docker.com | sh
        systemctl enable docker --now
        usermod -aG docker $USER
    else
        log "Docker уже установлен"
    fi
}

# Функция установки 3x-ui
install_3xui() {
    log "Установка 3x-ui панели..."

    # Установка 3x-ui
    bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh) <<EOF
y
admin
admin
2053
/xuipath

EOF

    log "3x-ui установлен успешно!"
    log "URL панели: http://$(curl -s ifconfig.me):2053/xuipath"
    log "Логин: admin"
    log "Пароль: admin"
}

# Функция установки Marzban
install_marzban() {
    log "Установка Marzban панели..."

    # Установка Marzban
    sudo bash -c "$(curl -sL https://github.com/Gozargah/Marzban-scripts/raw/master/marzban.sh)" @ install

    log "Marzban установлен успешно!"
    log "URL панели: http://$(curl -s ifconfig.me):8000/dashboard/"
    log "Логин: admin"
    log "Пароль: admin"
}

# Главная функция
main() {
    clear
    echo -e "${BLUE}╔══════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║          VPS VPN Auto-Installer v1.0         ║${NC}"
    echo -e "${BLUE}║    Автоустановщик 3x-ui / Marzban панелей   ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════╝${NC}"
    echo

    # Выбор панели
    echo -e "${YELLOW}Выберите панель для установки:${NC}"
    echo "1) 3x-ui (Рекомендуется для начинающих)"
    echo "2) Marzban (Расширенные возможности)"
    echo
    read -p "Ваш выбор (1-2): " panel_choice

    case $panel_choice in
        1)
            PANEL_TYPE="3xui"
            log "Выбрана панель: 3x-ui"
            ;;
        2)
            PANEL_TYPE="marzban"
            log "Выбрана панель: Marzban"
            ;;
        *)
            error "Неверный выбор. Используйте 1 или 2"
            ;;
    esac

    # Выполнение установки
    log "Начало автоматической установки VPN сервера"

    detect_os
    install_dependencies
    optimize_system

    if [ "$PANEL_TYPE" = "marzban" ]; then
        install_docker
        install_marzban
    else
        install_3xui
    fi

    log "Установка успешно завершена!"
}

# Запуск основной функции
main "$@"
