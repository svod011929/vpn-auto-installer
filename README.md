# VPS VPN Auto-Installer

Автоматический установщик VPN-панелей с настройкой системных параметров для VLESS, VMess и Shadowsocks/Outline.

> Статус: legacy/experimental. Для новых установок также смотрите специализированные репозитории `3x-ui-auto-installer`, `awg-bot-installer`, `vpn-server-installer` и `remnashop-installer` в профиле KodoDrive.

## Возможности

- установка 3x-ui или Marzban;
- настройка BBR и сетевых параметров;
- подготовка конфигураций для VLESS Reality, VMess WebSocket и Shadowsocks/Outline;
- базовые команды диагностики после установки.

## Требования

- Linux VPS с публичным IPv4;
- root/sudo;
- минимум 1 GB RAM и 10 GB свободного места;
- рекомендуется Ubuntu 22.04+ или Debian 11+.

## Установка

Перед запуском удалённого shell-скрипта рекомендуется скачать его и просмотреть содержимое.

```bash
wget https://raw.githubusercontent.com/svod011929/vpn-auto-installer/main/vpn-auto-installer.sh
chmod +x vpn-auto-installer.sh
sudo ./vpn-auto-installer.sh
```

Если в репозитории используется отдельный quick installer:

```bash
wget https://raw.githubusercontent.com/svod011929/vpn-auto-installer/main/quick-install.sh
chmod +x quick-install.sh
sudo ./quick-install.sh
```

## Доступ к панелям

Не используйте публичные дефолтные логины и пароли. После установки создайте уникальные учётные данные и ограничьте доступ к административной панели firewall/VPN.

Примеры URL зависят от выбранной панели и настроек установщика:

- 3x-ui: `http://YOUR_SERVER_IP:PORT/PATH`
- Marzban: `http://YOUR_SERVER_IP:8000/dashboard/`

## Протоколы

### VLESS + XTLS-Reality
Подходит для прямых подключений и современных Xray-клиентов.

### VMess + WebSocket
Вариант для окружений, где нужен WebSocket/CDN-совместимый транспорт.

### Shadowsocks / Outline
Более простой вариант для клиентов, поддерживающих эти протоколы.

## Диагностика

```bash
systemctl status x-ui
systemctl status marzban
ss -tlnp
journalctl -u x-ui -f
```

## Безопасность

- не храните токены и пароли в Git;
- ограничивайте административные порты;
- регулярно обновляйте ОС и панели;
- проверяйте installer перед запуском от root;
- делайте резервную копию конфигурации перед обновлениями.

## Лицензия

См. `LICENSE`, если файл присутствует в репозитории.

Используйте VPN-инфраструктуру в соответствии с применимым законодательством и правилами провайдера.
