# VPN Auto-Installer v1.0 - Архив проекта

Этот архив содержит полный проект автоматического установщика VPN панелей.

## 🚀 Быстрый старт:

1. Распакуйте архив на VPS сервере с Ubuntu/Debian/CentOS
2. Выполните команду: `chmod +x *.sh`
3. Запустите: `./vpn-auto-installer.sh`

## 📁 Структура проекта:

### Основные скрипты:
- **vpn-auto-installer.sh**    - Главный установщик
- **generate-configs.sh**      - Генератор конфигураций  
- **maintenance.sh**           - Скрипт обслуживания
- **quick-install.sh**         - Быстрая установка

### Конфигурация:
- **config.sh**               - Настройки по умолчанию
- **docker-compose.yml**      - Docker конфигурация

### Документация:
- **README.md**              - Полная документация
- **FAQ.md**                 - Часто задаваемые вопросы
- **CONTRIBUTING.md**        - Руководство для разработчиков

### Системные файлы:
- **LICENSE**                - MIT лицензия
- **.gitignore**             - Исключения Git
- **.github/workflows/test.yml** - GitHub Actions

## ⚡ Что делает скрипт:

1. **Выбор панели**: 3x-ui (простота) или Marzban (расширенность)
2. **Системная оптимизация**: BBR, сетевые настройки, лимиты
3. **Автоматическая настройка**: firewall, зависимости, службы
4. **Создание инбаундов**: 
   - VLESS + XTLS-Reality (порт 443) - максимальная скорость
   - VMess + WebSocket (порт 2053) - совместимость с CDN
   - Shadowsocks (порт 8388) - простота и стабильность

## 🔧 Системные требования:

- **ОС**: Ubuntu 20.04+, Debian 11+, CentOS 8+
- **RAM**: Минимум 1GB
- **Диск**: Минимум 10GB
- **Права**: Root доступ
- **Сеть**: Публичный IPv4

## 🛠 После установки:

### 3x-ui панель:
- URL: `http://YOUR_IP:2053/xuipath`
- Логин: `admin` (ОБЯЗАТЕЛЬНО СМЕНИТЬ!)
- Пароль: `admin` (ОБЯЗАТЕЛЬНО СМЕНИТЬ!)

### Marzban панель:
- URL: `http://YOUR_IP:8000/dashboard/`
- Логин: `admin` (ОБЯЗАТЕЛЬНО СМЕНИТЬ!)
- Пароль: `admin` (ОБЯЗАТЕЛЬНО СМЕНИТЬ!)

## 📱 Клиентские приложения:

- **Windows**: v2rayN, Hiddify
- **Android**: v2rayNG, Hiddify  
- **iOS**: FoxRay, Hiddify
- **macOS**: v2rayU, Hiddify
- **Shadowsocks**: Outline (все платформы)

## 🔒 ВАЖНЫЕ СОВЕТЫ ПО БЕЗОПАСНОСТИ:

1. **СРАЗУ смените пароли** панелей управления
2. **Включите 2FA** в настройках панели
3. **Настройте SSL** сертификаты для доменов
4. **Создавайте резервные копии**: `./maintenance.sh backup`
5. **Мониторьте систему**: `./maintenance.sh check`

## 🆘 Если что-то не работает:

1. **Проверьте логи**:
   ```bash
   journalctl -u x-ui -f       # для 3x-ui
   marzban logs                # для Marzban
   ```

2. **Проверьте порты**:
   ```bash
   ss -tlnp | grep :443
   ss -tlnp | grep :2053
   ss -tlnp | grep :8388
   ```

3. **Проверьте службы**:
   ```bash
   systemctl status x-ui
   systemctl status marzban
   ```

4. **Перезапустите службы**:
   ```bash
   systemctl restart x-ui
   systemctl restart marzban
   ```

## 🌐 Полезные ссылки:

- **GitHub проект**: https://github.com/svod011929/vpn-auto-installer
- **Официальный 3x-ui**: https://github.com/MHSanaei/3x-ui
- **Официальный Marzban**: https://github.com/Gozargah/Marzban
- **Клиент Hiddify**: https://hiddify.com/
- **Клиент Outline**: https://getoutline.org/

---

**ВАЖНО**: Использование VPN должно соответствовать местному законодательству. 
Авторы не несут ответственности за использование в незаконных целях.

**Удачной установки! 🚀**

---
*VPN Auto-Installer v1.0 - Полностью автоматизированное решение для развертывания VPN серверов*
