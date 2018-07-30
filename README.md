# dmitry-appnext_infra
dmitry-appnext Infra repository

# Table of content
- [Cloud bastion](#cloud-bastion)  [![Build Status](https://travis-ci.com/Otus-DevOps-2018-05/dmitry-appnext_infra.svg?branch=cloud-bastion)]

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

