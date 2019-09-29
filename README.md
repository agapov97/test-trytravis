# agapov97_infra
agapov97 Infra repository

##ДЗ 3

Поднято 2 сервера:
 - bastion - слушающий внешнюю сеть
 - someinternalhost - слушающий только внутреннюю сеть

На первом поднят VPN-сервер для возможности "напрямую" взаимодействовать из внешней сети со вторым

Для того, чтобы была возможность подключения при помощи команды `ssh someinternalhost`, предлагаю использовать файл hosts

Веб-интерфейс VPN-сервера с валидным сертификатом: https://35.205.237.167.xip.moss.sh

bastion_IP = 35.205.237.167
someinternalhost_IP = 10.132.0.3

##ДЗ 4

В ходе выполнения дз произошло знакомство с консольной утилитой gcloud, было поднято приложение reddit

testapp_IP = 35.205.50.190
testapp_port = 9292

Команда для создания ВМ с запуском скрипта автоинициализации:
`gcloud compute instances create reddit-app-autoinit  --boot-disk-size=10GB  --image-family ubuntu-1604-lts   --image-project=ubuntu-os-cloud   --machine-type=g1-small   --tags puma-server   --restart-on-failure --metadata-from-file startup-script=startup_script.sh`

Команда для создания правила браундмауэра:
`gcloud compute firewall-rules create default-puma-server --allow=tcp:9292 --target-tags=puma-server`
