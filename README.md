# dmitry-appnext_infra
dmitry-appnext Infra repository

# Table of content
- [Cloud bastion](#cloud-bastion)  [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/dmitry-appnext_infra.svg?branch=cloud-bastion)]
- [Cloud testapp](#cloud-testapp)  [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/dmitry-appnext_infra.svg?branch=cloud-testapp)]
- [Terraform-1](#cloud-testapp)  [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/dmitry-appnext_infra.svg?branch=terraform-1)]


# Homework 07. Terraform-2

### Что было сделано
Были созданы модули для конфиграции

Сделано задание со * - настроен backend в google bucket для prod & stage конфигураций
Убедился, что при одновременном запуске команды terraform apply для 2х разных конфигураций
срабатывает LOCK-механизм

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

