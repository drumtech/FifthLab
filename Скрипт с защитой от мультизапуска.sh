#!/bin/bash

if pidof -x $(basename $0) > /dev/null; then #���� ���� �������� � ����� �� ������ ("basename $0" - ��� ������������ �������)
   for p in $(pidof -x $(basename $0)); do #��� ������� ������ �������� ������ ��������
   if [ $p -ne $$ ]; then #���� ���� ������� �� �� ���� (�.�. �����, ��� ��������� �������)
   echo "Script $0 is already running: exiting" #����� � �������, ��� ������ ��� ��������
    exit #������� ������ �� �����
   fi
   done
fi

rsync -rlvth --progress --exclude=*.db --exclude "[Tt][Ee][Mm][Pp]/" --exclude "[Ss][Oo][Ff][Tt]/" --exclude "[Ss][Oo][Ff][Tt][Ww][Aa][Rr][Ee]/" --delete --log-file="/usr/local/rsync/rsync.log$(date +%Y%m%d%H%M)" --backup --backup-dir=/mnt/Test/Modified/$(date +\%Y\%m\%d\%H\%M\%S) \
/mnt/Serv/Backup \
/mnt/Test/2/


 #######������ �������� ��������� ����� ������,-r �������� ����������,-v �������� "����������� ���� ��������",-l �������� �������� ("������" ������),-t ��������� ����� �����������,--modify-window=1 ������������� ������������� �������� ����� �������� ����������� ��������� � �����, --delete - ����� ������� ���� � ���������, ��������� � � ��������� �����, --include-from= - �� ������ ���� ������ ���������������� �����, /mnt/rudfs/Software/DeployOS/Test/* - ���� ��� ����� ���������������� �����, /mnt/Data/111/ - ���� ���� ����������������



