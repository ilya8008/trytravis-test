# ilya8008_infra
ilya8008 Infra repository

## Домашнее задание 3

### Данные для подключения

bastion_IP = 35.205.99.171
someinternalhost_IP = 10.132.0.3

### Подключение к someinternalhost в одну команду

```ssh -A -i /Users/ilya/ilya8008.pem -J ilya8008@35.205.99.171 ilya8008@10.132.0.3```

### Подключение с помощью команды ssh someinternalhost
Добавляем настройки в файл ~/.ssh/config

```
Host someinternalhost
HostName 10.132.0.3
User ilya8008
IdentityFile ~/ilya8008.pem
AddKeysToAgent yes
ProxyJump ilya8008@35.205.99.171
```
Подключаемся при помощи команды ssh someinternalhost
