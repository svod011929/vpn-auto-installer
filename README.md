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

<!-- kododrive-projects-block -->

## Проекты KodoDrive

Другие проекты автора: [профиль @svod011929](https://github.com/svod011929) · [сайт](https://kododrive.ru) · [Telegram](https://t.me/KodoDrive)

### VPN и инфраструктура

- [BuryatVPN — VPN-сервис + Telegram](https://github.com/svod011929/buryatvpn)
- [VPN Server Installer — VLESS + TLS](https://github.com/svod011929/vpn-server-installer)
- [3X-UI Auto Installer](https://github.com/svod011929/3x-ui-auto-installer)
- [AWG Bot Installer — AmneziaWG](https://github.com/svod011929/awg-bot-installer)
- [RemnaShop Installer](https://github.com/svod011929/remnashop-installer)
- **VPN Auto Installer — панели** ← ты здесь
- [VPNHubBot — Telegram VPN-бот](https://github.com/svod011929/VPNHubBot)

### Telegram и автоматизация

- [KDS Server Panel — SSH из Telegram](https://github.com/svod011929/KDS_Server_Panel)
- [Telegram → VK Poster](https://github.com/svod011929/telegram-to-vk-poster)
- [KDS Parser CryptoBot](https://github.com/svod011929/kds_parser_cryptobot)
- [Auction Bot](https://github.com/svod011929/auction-bot)
- [Invest Bot](https://github.com/svod011929/invest-bot)
- [Crypto Check Bot](https://github.com/svod011929/crypto-check-bot)
- [KodoRefStarsBot](https://github.com/svod011929/KodoRefStarsBot)

### Магазины и финансы

- [KodoCashFlow](https://github.com/svod011929/KodoCashFlow)
- [Telegram Crypto Shop](https://github.com/svod011929/telegram-crypto-shop)
- [TalkProfit](https://github.com/svod011929/talkprofit)

### Сайты

- [KodoDrive Portfolio](https://github.com/svod011929/kododrive-portfolio)
- [kododrive.github.io](https://github.com/svod011929/kododrive.github.io)

<!-- /kododrive-projects-block -->
