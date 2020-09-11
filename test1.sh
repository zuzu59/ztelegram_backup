#!/usr/bin/env bash
#Petit script pour démarrer l'enregistrement des logs en version simple

# source: https://stackoverflow.com/questions/32034032/how-to-backup-telegram-chat

echo -e "
test1.sh.sh  zf200911.1300"

#!/bin/bash

TOKEN='YourBot:Token'

URL='https://api.telegram.org/bot'$TOKEN

UPD_URL=$URL'/getUpdates?offset='


function get_offset {

        res=$(curl $UPD_URL$OFFSET)
        OFFSET=$(echo $res | grep "update_id" | cut -f 4 -d ':' | cut -f 1 -d ',' | head -1)
        OFFSET=$((OFFSET+1))
}


while :
    do

get_offset


if echo $res | grep "message"

then echo $res >> BackupChat.txt

fi


done


