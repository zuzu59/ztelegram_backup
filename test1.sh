#!/usr/bin/env bash
#Petit script pour tester la récupération des messages sur Telegram afin de pouvoir les sauver

# source: https://stackoverflow.com/questions/32034032/how-to-backup-telegram-chat

echo -e "
test1.sh.sh  zf200911.1433"

# Il faut faire avant dans son terminal un:
# export zbackup_telegram_token=xxx
# avec son token personnel

# ou chez moi:
# source /keybase/private/zuzu59/ztelegram_backup/secrets_ztelegram_backup.sh

TOKEN=$zbackup_telegram_token

URL='https://api.telegram.org/bot'$TOKEN

UPD_URL=$URL'/getUpdates?offset='
echo $UPD_URL

#exit

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


