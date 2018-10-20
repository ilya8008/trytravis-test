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

## Домашнее задание 4

### Данные для подключения

testapp_IP = 35.240.32.147 
testapp_port = 9292

### Команда для создания инстанса с использованием startup script

```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \  
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=startup_script.sh
```

### Команда для создания правила firewall

```
gcloud compute firewall-rules create default-puma-server\
  --allow tcp:9292 \
 --source-ranges 0.0.0.0/0 \
 --target-tags puma-server
```

## Домашнее задание 5

### Сделано:

 - Установил packer
 - Установил ADC
 - Создал шаблон для packer
 - Создал скрипты для провижининга
 - Создал образ при помощи packer
 - Проверил образ, создал VM из образа и вручную выполнил deploy приложения
 - Добавил в шаблон пользовательские переменные
 - Запек в образ все зависимости и приложение, проверил работу
 - Создал скрипт для запуска VM из командной строки
