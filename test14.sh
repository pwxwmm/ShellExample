#!/bin/bash
DIR=$1
KEY=$2
for FILE in $(find $DIR -type f); do
    if grep $KEY $FILE &>/dev/null; then
        echo "--> $FILE"
    fi
done
