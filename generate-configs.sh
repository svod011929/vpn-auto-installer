#!/bin/bash

# Скрипт автоматического создания оптимальных конфигураций VPN
# Поддерживает создание VLESS, VMess, Shadowsocks конфигураций

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

generate_uuid() {
    if command -v uuidgen &> /dev/null; then
        uuidgen
    else
        cat /proc/sys/kernel/random/uuid
    fi
}

generate_password() {
    openssl rand -base64 32 | tr -d "=+/" | cut -c1-25
}

create_vless_reality_config() {
    local uuid=$(generate_uuid)
    local short_id=$(openssl rand -hex 4)

    cat > /tmp/vless-reality.json << EOF
{
  "remark": "VLESS-Reality-Optimal",
  "listen": "0.0.0.0",
  "port": 443,
  "protocol": "vless",
  "settings": {
    "clients": [
      {
        "id": "$uuid",
        "flow": "xtls-rprx-vision",
        "email": "vless-user"
      }
    ],
    "decryption": "none"
  },
  "streamSettings": {
    "network": "tcp",
    "security": "reality",
    "realitySettings": {
      "show": false,
      "dest": "www.google.com:443",
      "serverNames": [
        "www.google.com",
        "google.com"
      ],
      "shortIds": [
        "$short_id"
      ]
    }
  }
}
EOF

    echo -e "${GREEN}✅ VLESS Reality конфигурация создана${NC}"
    echo "UUID: $uuid"
    echo "Short ID: $short_id"
}

main() {
    echo -e "${YELLOW}=== Генератор оптимальных VPN конфигураций ===${NC}"
    create_vless_reality_config
    echo -e "${GREEN}🎉 Конфигурации созданы в /tmp/${NC}"
}

main "$@"
