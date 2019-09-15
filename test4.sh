#!/bin/bash
DATE=$(date +%F_%T)
USER_FILE=user.txt
echo_color(){
    if [ $1 == "green" ]; then
        echo -e "[32;40m$2[0m"
    elif [ $1 == "red" ]; then
        echo -e "[31;40m$2[0m"
    fi
}
# 如果用户文件存在并且大小大于0就备份
if [ -s $USER_FILE ]; then
    mv $USER_FILE ${USER_FILE}-${DATE}.bak
    echo_color green "$USER_FILE exist, rename ${USER_FILE}-${DATE}.bak"
fi
echo -e "User	Password" >> $USER_FILE
echo "----------------" >> $USER_FILE
for USER in user{1..10}; do
    if ! id $USER &>/dev/null; then
        PASS=$(echo $RANDOM |md5sum |cut -c 1-8)
        useradd $USER
        echo $PASS |passwd --stdin $USER &>/dev/null
        echo -e "$USER	$PASS" >> $USER_FILE
        echo "$USER User create successful."
    else
        echo_color red "$USER User already exists!"
    fi
done
