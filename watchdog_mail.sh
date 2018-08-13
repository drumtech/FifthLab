#!/bin/bash
restarts_count=0 #счётчик рестартов
while true;do #бесконечный цикл
    if (ps -A|grep postgres 2>1 > /dev/null);then #проверяем запущен ли процесс postgres
        echo "Keep working" #если запущен - пишем в консоль
        sleep 3 #и засыпаем на 3 секунды
    else
        if [ $restarts_count -gt 5 ];then #если рестартов postgresql больше 5-ти
            sudo reboot #ребутаемся
        fi
        echo "Alarm!" # если не запущен, пишем Alarm
        /etc/init.d/postgresql restart # рестартим postgres
        let restarts_count=restarts_count+1 #увеличиваем счётчик рестартов postgres
        echo "SENDING EMAIL!" # "шлём" email
		mail -s "Alarm postgres" cosa86@mail.ru
        sleep 3 #засыпаем на 3 секунды
    fi
done