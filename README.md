# dmitry-appnext_infra
dmitry-appnext Infra repository

# Table of content
- [Cloud bastion](#cloud-bastion)  [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/dmitry-appnext_infra.svg?branch=cloud-bastion)]
- [Cloud testapp](#cloud-testapp)  [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/dmitry-appnext_infra.svg?branch=cloud-testapp)]
- [Terraform-1](#terraform-1)  [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/dmitry-appnext_infra.svg?branch=terraform-1)]
- [Terraform-2](#terraform-2)  [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/dmitry-appnext_infra.svg?branch=terraform-2)]
- [Ansible-1](#ansible-1)  [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/dmitry-appnext_infra.svg?branch=ansible-1)]
- [Ansible-2](#ansible-2)  [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/dmitry-appnext_infra.svg?branch=ansible-2)]
- [Ansible-3](#ansible-3)  [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/dmitry-appnext_infra.svg?branch=ansible-3)]

# Homework 10. Ansible-3

# Homework 09. Ansible-2

### Что было сделано

- Задание со *: исследовать dynamic invenotry для GCE
  Читаем доки здесь: https://docs.ansible.com/ansible/2.5/scenario_guides/guide_gce.html
  Затем создаем сервис-аккаунт и ключи к нему (как создать - написано здесь https://support.google.com/cloud/answer/6158849?hl=en&ref_topic=6262490#serviceaccounts)
  Качаем gce.py, делаем его executable
  Кладем *.json файл с ключами в папку с инвентору
  Создаем файл secrets.py, заполняем его
  Затем можно выполнить команду ```gce.py --list >> inf.json``` и увидеть описание текущей инфарструктуры.
  После этого необходимо поменять asnible.cfg (inventory = ./gce.py)
  Затем обновить плейбуки (поменять hosts на тэги инстансов из gce.py --list и vars если нужно)
  Готово! Вы великолепны!


# Homework 08. Ansible-1

### Что было сделано
Создан плейбук клонирования репозитория с гитхаба. Если репозиторий был склонирован раньше, то в PLAY RECAP свойство changed = 0

# Homework 07. Terraform-2

### Что было сделано
Были созданы модули для конфигурации

Сделано задание со * - настроен backend в google bucket для prod & stage конфигураций.
Убедился, что при одновременном запуске команды terraform apply для 2х разных конфигураций
срабатывает LOCK-механизм

#### Проблемы
Выполняя задание со * столкнулся с тем, что сервис PUMA не запускается с переменными окружения, которые я ему передаю внутри .unit файла и приложение, соответственно, не видит базу данных
проверял я командой `cat /proc/3055/environ`, (3055 - PID) в ответ получил `292) [reddit]`

# Homework06. Terraform-1

### Что было сделано
Описана инфраструктура проекта с помощью терраформ

### Проблемы
Проблемы, которые я обнаружил:
Получилась длинная строчка с помощью который задаются ssh-ключи на проект:
```
resource "google_compute_project_metadata_item" "appuser1" {
        ...
        value   = "appuser1:${file(var.public_key_path1)}appuser2:${file(var.public_key_path1)}"
}
```




# Homework04. Cloud testapp

testapp_IP = 23.251.143.246
testapp_port = 9292

### Startup script example
gcloud compute instances create reddit-app3 \
--boot-disk-size=10GB \
--image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server \
--restart-on-failure \
--metadata-from-file startup-script=startup.sh

### Create firewall rule 
gcloud compute firewall-rules create "default-puma-server" \
--allow tcp:9292 \
--source-ranges="0.0.0.0/0" \
--target-tags=puma-server



# Homework03. Cloud bastion

## 1. Что было сделано
### Подключение к someinternalhost:
```
ssh -A -i ~/.ssh/appuser -J appuser@35.206.184.190 appuser@10.132.0.3
```

### подключения к someinternalhost по алиасу
~/.ssh/config file must cointain
```
Host bastion
        Hostname 35.206.184.190
        User appuser

Host someinternalhost
        Hostname 10.132.0.3
        User appuser
        ProxyJump bastion
```

## 2. Данные для проверки
```
bastion_IP = 35.206.184.190
someinternalhost_IP = 10.132.0.3
```

