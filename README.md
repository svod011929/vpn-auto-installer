# VPS VPN Auto-Installer

Автоматический установщик VPN панелей управления с предустановленными оптимальными конфигурациями для протоколов VLESS, VMess и Shadowsocks/Outline.

## 🌟 Особенности

- **Автоматическая установка** панелей 3x-ui или Marzban на выбор
- **Оптимизация системы** - настройка BBR, сетевых параметров и лимитов
- **Готовые конфигурации** - создание трех инбаундов с оптимальными настройками
- **Поддержка протоколов**:
  - VLESS + XTLS-Reality (максимальная скорость и безопасность)
  - VMess + WebSocket (универсальная совместимость)
  - Shadowsocks/Outline (простота и стабильность)

## 🔧 Системные требования

- **ОС**: Ubuntu 20.04+, Debian 11+, CentOS 8+, RHEL 8+, Fedora 35+
- **RAM**: Минимум 1GB, рекомендуется 2GB+
- **CPU**: 1 ядро (рекомендуется 2+ ядра)
- **Диск**: Минимум 10GB свободного места
- **Сеть**: Публичный IPv4 адрес
- **Права**: Root доступ

## 🚀 Быстрая установка

### Одной командой:

```bash
curl -sSL https://raw.githubusercontent.com/yourusername/vpn-auto-installer/main/quick-install.sh | bash
```

### Или скачать и запустить:

```bash
wget https://raw.githubusercontent.com/yourusername/vpn-auto-installer/main/vpn-auto-installer.sh
chmod +x vpn-auto-installer.sh
./vpn-auto-installer.sh
```

## 🛠 Панели управления

### 3x-ui
- **URL**: `http://YOUR_SERVER_IP:2053/xuipath`
- **Логин**: `admin`
- **Пароль**: `admin`
- **Особенности**: Простота настройки, интуитивный интерфейс

### Marzban
- **URL**: `http://YOUR_SERVER_IP:8000/dashboard/`
- **Логин**: `admin`
- **Пароль**: `admin`
- **Особенности**: Расширенная функциональность, API, мультиузел

## 🔐 Рекомендуемые конфигурации

### VLESS + XTLS-Reality
- **Преимущества**: Максимальная скорость, невозможность обнаружения DPI
- **Порт**: 443
- **Использование**: Прямые подключения

### VMess + WebSocket
- **Преимущества**: Совместимость с CDN, обход блокировок
- **Порт**: 2053
- **Использование**: Подключения через CloudFlare

### Shadowsocks/Outline
- **Преимущества**: Простота настройки, стабильность
- **Порт**: 8388
- **Использование**: Мобильные устройства

## 🛠 Устранение неполадок

### Панель управления не открывается
```bash
systemctl status x-ui        # для 3x-ui
systemctl status marzban     # для Marzban
ss -tlnp | grep :2053        # проверка портов
```

### Проверка логов
```bash
journalctl -u x-ui -f       # логи 3x-ui
marzban logs                # логи Marzban
```

## 📄 Лицензия

MIT License - см. [LICENSE](LICENSE) для деталей.

---

**Важно**: Использование VPN должно соответствовать местному законодательству.
