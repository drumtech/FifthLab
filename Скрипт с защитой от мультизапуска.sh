#!/bin/bash

if pidof -x $(basename $0) > /dev/null; then #если есть процессы с таким же именем ("basename $0" - им€ запускаемого скпипта)
   for p in $(pidof -x $(basename $0)); do #дл€ каждого такого процесса делаем проверку
   if [ $p -ne $$ ]; then #если этот процесс не мы сами (т.е. копи€, или подвисший процесс)
   echo "Script $0 is already running: exiting" #пишем в консоль, что скрипт уже работает
    exit #выходим ничего не дела€
   fi
   done
fi

rsync -rlvth --progress --exclude=*.db --exclude "[Tt][Ee][Mm][Pp]/" --exclude "[Ss][Oo][Ff][Tt]/" --exclude "[Ss][Oo][Ff][Tt][Ww][Aa][Rr][Ee]/" --delete --log-file="/usr/local/rsync/rsync.log$(date +%Y%m%d%H%M)" --backup --backup-dir=/mnt/Test/Modified/$(date +\%Y\%m\%d\%H\%M\%S) \
/mnt/Serv/Backup \
/mnt/Test/2/


 #######—крипт создани€ резервной копии файлов,-r означает рекурсивно,-v означает "комментиру€ свои действи€",-l копирует симлинки ("м€гкие" ссылки),-t фиксирует врем€ модификации,--modify-window=1 устанавливает односекундный интервал между временем модификации оригинала и копии, --delete - когда удал€ем файл в источнике, удал€етс€ и в резервной копии, --include-from= - то откуда берЄт список синхронизируемых папок, /mnt/rudfs/Software/DeployOS/Test/* - путь где лежат синхронизируемые папки, /mnt/Data/111/ - путь куда синхронизировать



