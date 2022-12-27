#!/bin/bash

FILE=/etc/shadow

if [ -e $FILE ]
then
    echo "Shadow jelszavak engedélyezve"

    if [ -w $FILE ]
    then
        echo "Van szerkesztési jogod a /etc/shadow -ra."
    else
        echo "Nincs szerkesztési jogod a /etc/shadow -ra."
    fi
else
    echo "Shadow jelszavak nincsenek engedélyezve"
fi
