#!/bin/bash

# Конфигурационный файл для VPN Auto-Installer
# Настройки по умолчанию

# Основные настройки
DEFAULT_PANEL="3xui"                    # Панель по умолчанию (3xui/marzban)
INSTALL_DOCKER="auto"                   # Установка Docker (auto/yes/no)
ENABLE_FIREWALL="yes"                   # Настройка firewall (yes/no)
ENABLE_OPTIMIZATION="yes"               # Системная оптимизация (yes/no)

# Настройки 3x-ui
XUID_PORT="2053"
XUID_USERNAME="admin"
XUID_PASSWORD="admin"
XUID_WEB_PATH="/xuipath"

# Настройки Marzban
MARZBAN_PORT="8000"
MARZBAN_USERNAME="admin"
MARZBAN_PASSWORD="admin"

# Настройки протоколов
VLESS_PORT="443"
VMESS_PORT="2053" 
SHADOWSOCKS_PORT="8388"

# Настройки оптимизации
ENABLE_BBR="yes"                        # Включить TCP BBR
OPTIMIZE_KERNEL="yes"                   # Оптимизация ядра
SYNC_TIME="yes"                         # Синхронизация времени
