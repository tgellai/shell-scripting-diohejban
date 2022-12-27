#!/bin/bash

FILES=$@

for FILE in $FILES
do
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
done
