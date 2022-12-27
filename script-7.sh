#!/bin/bash

if [ -z $1 ]
then
    read -p "Adjon meg egy fájl vagy könyvtár elérést a vizsgálathoz! " FILE
else
    FILE=$1
fi

if [ -f $FILE ]
then
    echo "A megadott elérésen egy általános fájl található."
elif [ -d $FILE ]
then
    echo "A megadott elérésen egy könyvtár található."
else
    echo "A megadott elérésen egy egyéb fájltípus található."
fi

ls -l $FILE
