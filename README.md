# agapov97_infra
agapov97 Infra repository

Поднято 2 сервера:
 - bastion - слушающий внешнюю сеть
 - someinternalhost - слушающий только внутреннюю сеть

На первом поднят VPN-сервер для возможности "напрямую" взаимодействовать из внешней сети со вторым

Для того, чтобы была возможность подключения при помощи команды `ssh someinternalhost`, предлагаю использовать файл hosts

Веб-интерфейс VPN-сервера с валидным сертификатом: https://35.205.237.167.xip.moss.sh

bastion_IP = 35.205.237.167
someinternalhost_IP = 10.132.0.3
